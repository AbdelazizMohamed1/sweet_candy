import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweet_candy/features/login/login_screen.dart';
import 'package:sweet_candy/features/login/widgets/row_under_button.dart';
import 'package:sweet_candy/features/signup/manager/signup_cubit.dart';
import 'package:sweet_candy/features/signup/manager/signup_states.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/const_assets.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/widgets/back_arrow.dart';
import 'package:sweet_candy/shared/widgets/back_arrow_text_icon.dart';
import 'package:sweet_candy/shared/widgets/default_form_field.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import '../../generated/l10n.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SignupCubit cubit = SignupCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BackArrowTextIcon(text: S.of(context).create_new_account,hasIcon: false,hasArrow: true,hasText: true,),
                  height40,
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
                  height32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
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
                            controller: shopNameController,
                            textInputType: TextInputType.text,
                            prefix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(ConstAssets.shopName),
                            ),
                            hintText: S.of(context).shop_name),
                        height24,
                        defaultTextFormField(
                            controller: addressController,
                            textInputType: TextInputType.text,
                            prefix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(ConstAssets.shopName),
                            ),
                            hintText: S.of(context).address),
                        height24,
                        defaultTextFormField(
                            controller: phoneController,
                            textInputType: TextInputType.phone,
                            prefix: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(ConstAssets.phone),
                            ),
                            hintText: S.of(context).phone),
                        height24,
                        defaultTextFormField(
                          controller: passwordController,
                          textInputType: TextInputType.text,
                          prefix: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(ConstAssets.lock),
                          ),
                          obscureText: cubit.isPassword,
                          hintText: S.of(context).Password,
                          suffix: cubit.isPassword
                              ? IconButton(
                                  onPressed: () {
                                    cubit.showPassword();
                                  },
                                  icon: const Icon(Icons.visibility_outlined))
                              : IconButton(
                                  onPressed: () {
                                    cubit.showPassword();
                                  },
                                  icon: const Icon(
                                      Icons.visibility_off_outlined)),
                        ),
                        height24,
                        defaultTextFormField(
                          controller: rePasswordController,
                          textInputType: TextInputType.text,
                          prefix: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(ConstAssets.lock),
                          ),
                          obscureText: cubit.isRePassword,
                          hintText: S.of(context).confirm_password,
                          suffix: cubit.isRePassword
                              ? IconButton(
                                  onPressed: () {
                                    cubit.showRePassword();
                                  },
                                  icon: const Icon(Icons.visibility_outlined))
                              : IconButton(
                                  onPressed: () {
                                    cubit.showRePassword();
                                  },
                                  icon: const Icon(
                                      Icons.visibility_off_outlined)),
                        )
                      ],
                    ),
                  ),
                  height32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: defaultMaterialButton(
                      onPressed: () {
                        // cubit.register(
                        //   name: userNameController.text,
                        //   shopName: shopNameController.text,
                        //   address: addressController.text,
                        //   phone: phoneController.text,
                        //   password: passwordController.text,
                        //   confirmationPassword: rePasswordController.text,
                        //   image: cubit.image
                        // );
                      },
                      text: S.of(context).confirm,
                      widget: Container(),
                    ),
                  ),
                  height32,
                  RowUnderButton(
                    text1: S.of(context).already_have_account,
                    text2: S.of(context).LoginSpace,
                    onPressed: () {
                      Components.navigateTo(
                          context: context, widget: LoginScreen());
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
