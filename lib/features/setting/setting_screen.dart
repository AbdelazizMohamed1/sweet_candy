import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/widgets/back_arrow_text_icon.dart';

import '../../generated/l10n.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackArrowTextIcon(text: S.of(context).settings, hasIcon: false, hasText: true, hasArrow: true)
          ],
        ),
      ),
    );
  }
}
