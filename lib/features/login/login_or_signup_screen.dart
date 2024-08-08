import 'package:flutter/material.dart';
import 'package:sweet_candy/features/login/login_screen.dart';
import 'package:sweet_candy/features/signup/signup_screen.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';

import '../../generated/l10n.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Image(image: AssetImage('images/logo.png')),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,bottom: 30),
            child: Column(
              children: [
                defaultMaterialButton(
                  onPressed: () {
                    Components.navigateTo(context: context, widget:  LoginScreen());
                  },
                  text: S.of(context).LoginSpace,
                  widget: Container(),
                ),
                height16,
                defaultMaterialButton(
                  onPressed: () {
                    Components.navigateTo(context: context, widget:  SignupScreen());
                  },
                  text: S.of(context).Signup,
                  widget: Container(),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
