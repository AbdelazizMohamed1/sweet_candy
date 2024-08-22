import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/width.dart';
import '../../../generated/l10n.dart';
import '../../../shared/components/components.dart';
import '../../../shared/widgets/back_arrow_text_icon.dart';
import '../contact_us/contact_us_screen.dart';

class AboutAndHelpScreen extends StatelessWidget {
   const AboutAndHelpScreen({super.key, required this.title, required this.contain});
  final String title;
  final String contain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackArrowTextIcon(
                  text: title,
                  hasIcon: false,
                  hasText: true,
                  hasArrow: true),
              height64,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  contain,
               style: text16W400(context),
                ),
              ),
              height40,
              defaultMaterialButton(onPressed: () {
                Components.navigateTo(context: context, widget:  ContactUsScreen());
              }, text: S.of(context).for_contact_us, widget: Container(),width: fullWidth(context: context) *0.5)
            ],
          ),
        ),
      ),
    );
  }
}
