import 'package:flutter/material.dart';

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
              BackArrow(),
              height40,
              Center(child: HeadlineText(text: S.of(context).wait_permission)),
              height16,
              HintText(text: S.of(context).please_wait),
            ],
          ),
        ),
      ),
    );
  }
}
