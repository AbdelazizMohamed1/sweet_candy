import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/features/login/forget_password/forget_password.dart';
import 'package:sweet_candy/features/login/widgets/row_under_button.dart';
import 'package:sweet_candy/features/signup/signup_screen.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/const_assets.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/widgets/default_form_field.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/widgets/default_text_button.dart';
import '../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: fullHeight(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Components.navigateBack(context: context);
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
                const Spacer(),
                const Center(child: Image(image: AssetImage(ConstAssets.logo))),
                height55,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      defaultTextFormField(
                          controller: phoneController,
                          textInputType: TextInputType.phone,
                          prefix: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              ConstAssets.phone,
                            ),
                          ),
                          hintText: S.of(context).PhoneNumber),
                      height16,
                      defaultTextFormField(
                          controller: passwordController,
                          textInputType: TextInputType.text,
                          obscureText: true,
                          suffix: const Icon(Icons.remove_red_eye_outlined),
                          prefix: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              ConstAssets.lock,
                            ),
                          ),
                          hintText: S.of(context).Password),
                      height16,
                      defaultTextButton(
                        context: context,
                        onPressed: () {
                          Components.navigateTo(context: context, widget:  ForgetPassword());
                        },
                        text: S.of(context).ForgetPassword,
                      ),
                      height32,
                      defaultMaterialButton(
                        onPressed: () {},
                        text: S.of(context).LoginSpace,
                        widget: Container(),
                      ),
                      height24,
                      RowUnderButton(
                        text1: S.of(context).no_account,
                        text2: S.of(context).Signup,
                        onPressed: () {
                          Components.navigateTo(
                              context: context, widget: SignupScreen());
                        },
                      )
                    ],
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
