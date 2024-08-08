import 'package:flutter/material.dart';

TextStyle text24W700(BuildContext context, {Color? color}) => TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
);

TextStyle text24W400(BuildContext context, {Color? color}) => TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
  color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
);

TextStyle text16W400(BuildContext context, {Color? color}) => TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
);

TextStyle text12W600(BuildContext context, {Color? color}) => TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
);