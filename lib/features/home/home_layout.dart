import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/features/home/manager/home_cubit.dart';
import 'package:sweet_candy/features/home/manager/home_states.dart';
import 'package:sweet_candy/features/setting/points/points_screen.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/const_assets.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';
import '../setting/setting_screen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  PageController bodyController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          List<Widget> bottomNavBarItems = [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  bodyController.jumpToPage(0);
                  print('${cubit.bodyIndex} body');
                },
                child: bottomNavItem(
                  imagePath: ConstAssets.home,
                  color: cubit.bodyIndex == 0 ? mainColor : mainBlack,

                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  bodyController.jumpToPage(1);
                  print('${cubit.bodyIndex} body');
                },
                child: bottomNavItem(
                  imagePath: ConstAssets.order,
                  color: cubit.bodyIndex == 1 ? mainColor : mainBlack,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  bodyController.jumpToPage(2);
                  print('${cubit.bodyIndex} body');
                },
                child: bottomNavItem(
                  imagePath: ConstAssets.search,
                  color: cubit.bodyIndex == 2 ? mainColor : mainBlack,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  bodyController.jumpToPage(3);
                  print('${cubit.bodyIndex} body');
                },
                child: bottomNavItem(
                  imagePath: ConstAssets.profile,
                  color: cubit.bodyIndex == 3 ? mainColor : mainBlack,
                ),
              ),
            )
          ];
          Widget bottomNavBar(int index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: bottomNavBarItems,
                ),
              );
          Widget title(int index) {
            if (index == 0) {
              return const Text('');
            } else if (index == 1) {
              return Text(
                S.of(context).my_orders,
                style: text20W400(context),
              );
            } else if (index == 2) {
              return Text(
                S.of(context).search,
                style: text20W400(context),
              );
            } else {
              return Text(
                S.of(context).account_information,
                style: text20W400(context),
              );
            }
          }

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: PageView.builder(
                  padEnds: false,
                  itemCount: cubit.body.length,
                  controller: bodyController,
                  onPageChanged: (value) {
                    print('${value} page');
                    cubit.toggleBetweenBody(value);
                  },
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            children: [
                              Offstage(
                                  offstage: cubit.bodyIndex != 0,
                                  child: InkWell(
                                      onTap: () {
                                        Components.navigateTo(context: context, widget: PointsScreen());
                                      },
                                      child: SvgPicture.asset('images/reward.svg'))),
                              width24,
                              const Spacer(),
                              Offstage(
                                  offstage: cubit.bodyIndex == 0,
                                  child: title(cubit.bodyIndex)),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    Components.navigateTo(
                                        context: context,
                                        widget: const SettingScreen());
                                  },
                                  child:
                                      SvgPicture.asset('images/setting.svg')),
                            ],
                          ),
                        ),
                        cubit.body[cubit.bodyIndex],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: bottomNavBar(
              cubit.bodyIndex,
            ),
          );
        },
      ),
    );
  }
}

class bottomNavItem extends StatelessWidget {
  bottomNavItem({super.key, required this.imagePath, required this.color});
  final String imagePath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      colorFilter: ColorFilter.mode(
        color, BlendMode.srcIn,
      ),
    );
  }
}
