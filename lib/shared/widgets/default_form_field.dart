import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';


Widget defaultTextFormField({
  required TextEditingController controller,
  bool obscureText = false,
  required TextInputType textInputType,
  String? hintText,
  Widget? prefix,
  Widget? suffix,
  FormFieldValidator<String>? validate,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  void Function()? onTap,
  String? labelText,
  bool readOnly = false,
  FocusNode? focusNode,
  double borderRadius = 10.0,
  TextAlign textAlign = TextAlign.start,
  Color? color
}) =>
    TextFormField(
        textAlign: textAlign,
        focusNode: focusNode,
        readOnly: readOnly,
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        onChanged: onChange,
        validator: validate,
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 11,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color??mainColor, width: 1.0),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
              borderRadius: BorderRadius.circular(10)
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide:  const BorderSide(width: 1)),
          suffixIcon: suffix,
          prefixIcon: prefix,

        ));