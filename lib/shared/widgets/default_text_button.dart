import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/text.dart';

Widget defaultTextButton({
  required void Function()? onPressed,
  required String text,
  required context,
  Color? color
}) => TextButton(
  onPressed: onPressed,
  style: ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    minimumSize: WidgetStateProperty.all<Size>(Size.zero),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
  ),
  child: Text(text,style: text12W600(context , color: color),),
);