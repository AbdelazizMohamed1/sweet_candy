import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sweet_candy/features/signup/manager/signup_cubit.dart';
import 'package:sweet_candy/features/signup/manager/signup_states.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/widgets/back_arrow.dart';
import 'package:sweet_candy/shared/widgets/headline_text.dart';
import 'package:sweet_candy/shared/widgets/hint_text.dart';

import '../../../generated/l10n.dart';
import '../../../shared/components/components.dart';
import '../../../shared/const_assets.dart';
import '../../../shared/widgets/default_form_field.dart';
import '../../../shared/widgets/default_material_button.dart';
import '../wait_permission/wait_permission_screen.dart';

class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit,SignupStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        SignupCubit cubit = SignupCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackArrow(),
                  height40,
                  Center(child: HeadlineText(text: S.of(context).new_password)),
                  height16,
                  HintText(text: S.of(context).password_must_be_different),
                  height40,
                  defaultTextFormField(
                    controller: passwordController,
                    textInputType: TextInputType.text,
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(ConstAssets.lock),
                    ),
                    obscureText: cubit.isPassword,
                    hintText: S.of(context).Password,
                    suffix: cubit.isPassword ?
                    IconButton(onPressed: () {
                      cubit.showPassword();
                    }, icon: const Icon(Icons.visibility_outlined)) :
                    IconButton(onPressed: () {
                      cubit.showPassword();
                    }, icon: const Icon(Icons.visibility_off_outlined)),
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
                    suffix: cubit.isRePassword ?
                    IconButton(onPressed: () {
                      cubit.showRePassword();
                    }, icon: const Icon(Icons.visibility_outlined)) :
                    IconButton(onPressed: () {
                      cubit.showRePassword();
                    }, icon: const Icon(Icons.visibility_off_outlined)),),
                  height40,
                  defaultMaterialButton(
                      widget: Container(),
                      onPressed: () {

                        Components.navigateTo(context: context, widget: const WaitPermissionScreen());
                        // if (_otpController.text.isEmpty) {
                        //   errorText = S.of(context).pleaseEnterOTP;
                        // } else if (_otpController.text.length != 5) {
                        //   errorText = S.of(context).OTPMustBe5Digits;
                        // } else {
                        //   errorText = '';
                        //   print('OTP entered: ${_otpController.text}');
                        // }
                        // Components.navigateTo(context: context, widget: NewPasswordScreen());
                      },
                      text: S.of(context).create_new_password)
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
