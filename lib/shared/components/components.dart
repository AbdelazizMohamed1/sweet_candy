

import 'package:flutter/material.dart';





class Components{

  static void navigateTo({required context,required widget}) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));

  static void navigateAndFinish({required context,required widget}) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget,));

  static void navigateBack({required context}) => Navigator.pop(context);



}