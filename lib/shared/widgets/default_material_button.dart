import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';


import '../width.dart';

Widget defaultMaterialButton({
  required VoidCallback? onPressed,
  required String text,
  required Widget widget,
  double width = double.infinity,
  Color? color = const Color.fromRGBO(159, 84, 79, 1),
  Color? textColor = Colors.white,
  double height = 50.0
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(text,
              style: TextStyle(
                  color: textColor
              ),
            ),
            Offstage(
                offstage: widget != null ? false : true,
                child: width10),
            widget,
          ],
        ),

      ),
    );