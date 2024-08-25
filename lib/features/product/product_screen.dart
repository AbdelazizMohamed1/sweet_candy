import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';
import '../../shared/widgets/back_arrow_text_icon.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackArrowTextIcon(
              hasIcon: false,
              hasText: false,
              hasArrow: true,
              text: '',
            ),
            height24,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 42),
              width: fullWidth(context: context),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('images/product1.png'),
                    fit: BoxFit.contain,
                    width: 140,
                    height: 180,
                  ),
                  height24,
                  SizedBox(
                    width: fullWidth(context: context) * 0.5,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                        const Spacer(),
                        Text('$quantity'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  height24,
                  Text(
                    'perspiciatis unde omnis iste natus error sit voluptatem accusantium in offer if you buy 20 p.p get 1 for free .',
                    style: text16W600(context),
                    textAlign: TextAlign.center,
                  ),
                  height24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2500\$',
                        style: text16W600(context),
                      ),
                      Row(
                        children: [
                          Text(
                            '2600\$',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: green,
                                decorationColor: green,
                                decorationThickness: 2),
                          ),
                          Text(
                            ' 16% OFF',
                            style: text16W600(context, color: green),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height64,
                  defaultMaterialButton(
                    onPressed: () {

                    },
                    text: S.of(context).order_now,
                    widget: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
