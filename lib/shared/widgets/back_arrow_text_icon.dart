import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';
import 'back_arrow.dart';

class BackArrowTextIcon extends StatelessWidget {
   BackArrowTextIcon({super.key, required this.text, required this.hasIcon,this.iconWidget,required this.hasText,required this.hasArrow});
  final String text;
  final bool hasIcon;
  bool hasText = true;
   bool hasArrow = true;
  Widget? iconWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: Row(
        children: [
          Offstage(
              offstage: hasArrow ? false : true,
              child: const BackArrow()),
          const Spacer(),
          Offstage(
              offstage: hasText ? false : true,
              child: Text(text,style: text20W600(context),)),
          Offstage(
              offstage: hasIcon ? true : false,
              child: width40
          ),
          const Spacer(),
          Offstage(
              offstage: hasIcon ? false : true,
              child: iconWidget
          )
        ],
      ),
    );
  }
}
