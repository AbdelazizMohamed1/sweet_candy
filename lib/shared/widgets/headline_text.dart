import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/text.dart';

class HeadlineText extends StatelessWidget {
   HeadlineText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: text24W700(context),);
  }
}
