import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../shared/widgets/default_text_button.dart';

class RowUnderButton extends StatelessWidget {
   RowUnderButton({super.key, required this.text1, required this.text2, this.onPressed,this.color,this.mainAxisAlignment});
  final String text1;
  final String text2;
   final void Function()? onPressed;
   Color? color;
   MainAxisAlignment? mainAxisAlignment = MainAxisAlignment.center;
   @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.center,
      children: [
        Text(text1),
        defaultTextButton(
          onPressed: onPressed,
          text: text2,
          color: color,
          context: context,
        )
      ],
    );
  }
}
