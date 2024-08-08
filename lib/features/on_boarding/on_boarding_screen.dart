import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/core/models/on_boarding_model.dart';
import 'package:sweet_candy/features/home/home_screen.dart';
import 'package:sweet_candy/features/login/login_or_signup_screen.dart';
import 'package:sweet_candy/features/login/login_screen.dart';
import 'package:sweet_candy/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:sweet_candy/features/on_boarding/manager/on_boarding_states.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/widgets/default_text_button.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  bool isLast = false;


  void submit({isLast}) {
    if (isLast) {
      Components.navigateAndFinish(
          context: context, widget: const LoginOrSignupScreen());
    }
    // CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit,OnBoardingStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Scaffold(
            backgroundColor: onBoardingBackground,
            body: SafeArea(
              child: Column(
                children: [
                  cubit.onBoardingData.isNotEmpty ?
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (index) {
                        if (index == cubit.onBoardingData.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      controller: boardingController,
                      itemBuilder: (context, index) =>
                          builtBoardingItem(cubit.onBoardingData,index),
                      itemCount: cubit.onBoardingData.length,
                    ),
                  ) : const Center(child: CircularProgressIndicator(),),
                  height24,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
                    child: defaultMaterialButton(
                        onPressed: () {
                          isLast
                              ? submit(isLast: isLast)
                              : boardingController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        text: S.of(context).Continue,
                        widget: Icon(Icons.arrow_forward_rounded,color: onBoardingBackground,)),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget builtBoardingItem(List<OnBoardingModel> model,int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Offstage(
            offstage: isLast ? false : true,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          boardingController.jumpToPage(1);
                        });
                      },
                      icon: const Icon(Icons.arrow_back_outlined)),
                  const Spacer(),
                  defaultTextButton(
                    context: context,
                    onPressed: () {
                      Components.navigateAndFinish(context: context, widget:  LoginScreen());
                    },
                    text: S.of(context).Login,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Image.network(
              model[index].imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Text(model[index].mainTitle!, style: text24W700(context)),
          height24,
          Text(
            model[index].details!,
            style: text16W400(context),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
