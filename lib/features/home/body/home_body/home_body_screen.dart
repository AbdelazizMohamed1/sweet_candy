import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/width.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 140,
            width: fullWidth(context: context),
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'OFFER UP TO \n30%',
                      style: text24W700(context),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    defaultMaterialButton(
                      onPressed: () {},
                      text: 'order now',
                      widget: Container(),
                      color: mainColor,
                      width: fullWidth(context: context) / 3,
                      height: 30,
                    )
                  ],
                ),
                const Spacer(),
                Image.asset('images/product.png'),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
