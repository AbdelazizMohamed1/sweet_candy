import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../shared/height.dart';
import '../../../shared/text.dart';
import '../../../shared/widgets/back_arrow_text_icon.dart';

class PointsScreen extends StatelessWidget {
   PointsScreen({super.key});

  bool hasPoints = false;

  Widget widget(context) {
    if (hasPoints) {
      return  Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Image.asset('images/reward.png'),
            height64,
            Text(
              'You have obtained 30 points, you can use it for your next order and get a 20% off .',
              style: text16W600(context),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Image.asset('images/no_data.png'),
            height64,
            Text(
              S.of(context).no_points_yet,
              style: text16W600(context),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BackArrowTextIcon(
                  text: S.of(context).your_points,
                  hasIcon: false,
                  hasText: true,
                  hasArrow: true),
              widget(context)
          ],
          ),
        )
    );

  }
}
