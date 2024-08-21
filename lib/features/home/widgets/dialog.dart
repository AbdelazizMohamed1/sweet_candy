import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../shared/colors.dart';
import '../../../shared/text.dart';

class DialogComponent extends StatelessWidget {
  DialogComponent({super.key, required this.text, required this.buttonTwo,this.onPressed});
  final String text;
  final String buttonTwo;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        style: text20W600(context),
        textAlign: TextAlign.center,
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: mainColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: white,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      S.of(context).cancel,
                      style: text16W600(context, color: mainColor),
                    ),),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: onPressed,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      buttonTwo,
                      style: text16W600(context, color: white),
                    ),),
                ),
              ),

            ],
          ),
        ],
      ),
      backgroundColor: white,
    );
  }
}
