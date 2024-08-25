import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_form_field.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../../generated/l10n.dart';
import '../../../shared/components/components.dart';
import '../code_verification/code_verification_screen.dart';
import '../widgets/country_list_container.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String finalResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Components.navigateBack(context: context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            height55,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).enter_phone_number,
                    style: text24W700(context),
                  ),
                  height24,
                  Text(
                    S.of(context).verification_message,
                    style: text16W400(context),
                  ),
                  height24,
                  Row(
                    children: [
                      SizedBox(
                        width: fullWidth(context: context) / 4,
                        child: ListContainer(
                          controller: countryController,
                          text: countryController.text,
                          onTap: () {
                            showCountryPicker(
                              countryFilter: ['PS','IL'],
                              context: context,
                              onSelect: (value) {
                                countryController.text =
                                    '${value.flagEmoji}  +${value.phoneCode}';

                                finalResult = value.phoneCode;
                                print('Selected Country: ${value.phoneCode}');
                              },
                            );
                          },
                        ),
                      ),
                      width16,
                      Expanded(
                          child: defaultTextFormField(
                              controller: phoneController,
                              textInputType: TextInputType.phone))
                    ],
                  ),
                  height40,
                  defaultMaterialButton(
                    onPressed: () {
                       if(finalResult != '' && phoneController.text.isNotEmpty){
                         finalResult = '+${finalResult+phoneController.text}';
                         print(finalResult);
                         Components.navigateTo(context: context, widget: CodeVerificationScreen(number: finalResult,));
                         finalResult = '';

                       }
                    },
                    text: S.of(context).send_code,
                    widget: Container(),
                  )
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
