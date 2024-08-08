import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/text.dart';

class HintText extends StatelessWidget {
   HintText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: text16W400(context,color: gray),);
  }
}
