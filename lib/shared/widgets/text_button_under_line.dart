import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';

class TextButtonUnderLine extends StatelessWidget {
   TextButtonUnderLine({super.key, required this.text, this.onPressed});
 final String text;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
        style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black,
        decoration: TextDecoration.underline
      ),),
    );
  }
}
