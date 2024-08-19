import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sweet_candy/features/login/new_password/new_password_screen.dart';
import 'package:sweet_candy/features/login/widgets/row_under_button.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/widgets/back_arrow_text_icon.dart';

import '../../../generated/l10n.dart';
import '../../../shared/components/components.dart';
import '../../../shared/text.dart';
import '../../../shared/widgets/default_material_button.dart';
import '../../../shared/width.dart';

class CodeVerificationScreen extends StatelessWidget {
  CodeVerificationScreen({super.key, required this.number});
  TextEditingController _otpController = TextEditingController();
  String errorText = '';
  final String number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackArrowTextIcon(text: S.of(context).verify_your_phone_number, hasIcon: false,hasText: true,hasArrow: true,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height32,
                  Text(
                    '${S.of(context).enter_4_digit_code} $number',
                    style: text16W400(color: mainBlack, context),
                  ),
                  height32,
                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return;
                      }
                      if (value.length != 4) {
                        return;
                      }
                      return null;
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 65,
                      fieldWidth: (fullWidth(context: context) / 4) - 30,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: mainColor,
                      inactiveColor: mainColor,
                      selectedColor: mainColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    controller: _otpController,
                    appContext: context,
                    textStyle: text24W400(context, color: mainColor),
                  ),
                  if (errorText.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        errorText,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  height32,
                  RowUnderButton(
                    text1: S.of(context).did_not_receive_code,
                    text2: S.of(context).resend_code,
                    color: mainColor,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),


                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultMaterialButton(
                widget: Container(),
                onPressed: () {
                  print(_otpController.text);
                  Components.navigateTo(context: context, widget: NewPasswordScreen());
                },
                text: S.of(context).verify,
              ),
            ),
          ],
        )

      ),

    );
  }
}
