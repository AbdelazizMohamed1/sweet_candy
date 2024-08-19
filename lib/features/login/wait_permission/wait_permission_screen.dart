import 'package:flutter/material.dart';
import 'package:sweet_candy/features/home/home_layout.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/widgets/default_text_button.dart';

import '../../../generated/l10n.dart';
import '../../../shared/height.dart';
import '../../../shared/widgets/back_arrow.dart';
import '../../../shared/widgets/headline_text.dart';
import '../../../shared/widgets/hint_text.dart';

class WaitPermissionScreen extends StatelessWidget {
  const WaitPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackArrow(),
              height40,
              Center(child: HeadlineText(text: S.of(context).wait_permission)),
              height16,
              HintText(text: S.of(context).please_wait),
              const Spacer(),
              Center(child: Image.asset('images/wait.png')),
              const Spacer(),
              Center(
                child: Text(S.of(context).contact_admin,style: TextStyle(
                  color: mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationColor: mainColor
                ),
                ),
              ),
              height16,
              GestureDetector(
                onTap: () {
                  Components.navigateAndFinish(context: context, widget:  HomeLayout());
                },
                child: Center(
                  child: Text(S.of(context).send_email,style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: mainColor
                  ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
