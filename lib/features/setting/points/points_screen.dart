import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../shared/widgets/back_arrow_text_icon.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

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
          ],
        ),
      ),
    );
  }
}
