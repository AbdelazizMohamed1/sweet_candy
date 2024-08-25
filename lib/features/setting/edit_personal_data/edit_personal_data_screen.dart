import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweet_candy/features/signup/manager/signup_cubit.dart';
import 'package:sweet_candy/features/signup/manager/signup_states.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/const_assets.dart';
import 'package:sweet_candy/shared/height.dart';

import '../../../generated/l10n.dart';
import '../../../shared/widgets/back_arrow_text_icon.dart';
import '../../../shared/widgets/default_form_field.dart';
import '../../../shared/widgets/default_material_button.dart';

class EditPersonalDataScreen extends StatelessWidget {
   EditPersonalDataScreen({super.key});
   TextEditingController userNameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit,SignupStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        SignupCubit cubit = SignupCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BackArrowTextIcon(
                    hasIcon: true,
                    hasText: true,
                    hasArrow: true,
                    iconWidget: SvgPicture.asset(
                      ConstAssets.edit,
                      colorFilter: ColorFilter.mode(
                        mainColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    text: S.of(context).edit_personal_data,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: fullHeight(context: context) - 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 1,),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cubit.pickImage(ImageSource.gallery);
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: cubit.image != null
                                                  ? FileImage(cubit.image!)
                                                  : const AssetImage(ConstAssets.user),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                          color: Colors.white, shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                             height64,
                              defaultTextFormField(
                                  controller: userNameController,
                                  textInputType: TextInputType.text,
                                  prefix: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(ConstAssets.userName),
                                  ),
              
                                  hintText: S.of(context).name),
                              height24,
                              defaultTextFormField(
                                  controller: phoneController,
                                  textInputType: TextInputType.phone,
                                  prefix: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(ConstAssets.phone),
                                  ),
                                  hintText: S.of(context).phone),
                            ],
                          ),
                          const Spacer(flex: 2,),
                          defaultMaterialButton(
                            onPressed: () {
              
                            },
                            text: S.of(context).save_changes,
                            widget: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
              
              
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
