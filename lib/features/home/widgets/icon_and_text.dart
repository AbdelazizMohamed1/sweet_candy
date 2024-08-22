import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/colors.dart';
import '../../../shared/widgets/hint_text.dart';
import '../../../shared/width.dart';

class IconAndText extends StatelessWidget {
   IconAndText({super.key, required this.text, required this.imagePath});
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          imagePath,
          colorFilter: ColorFilter.mode(
            gray,
            BlendMode.srcIn,
          ),
        ),
        width10,
        HintText(
          text: text,
        ),

      ],
    );
  }
}
