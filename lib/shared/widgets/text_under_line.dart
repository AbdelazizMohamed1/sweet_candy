import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/text.dart';

class TextUnderLine extends StatelessWidget {
  TextUnderLine({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            decoration: TextDecoration.underline,
            decorationThickness: 2));
  }
}
