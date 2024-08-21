import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sweet_candy/features/home/widgets/product_item_in_order.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../../../generated/l10n.dart';

class OrderBodyScreen extends StatelessWidget {
  OrderBodyScreen({super.key});

  bool hasOrder = true;

  Widget widget(context) {
    if (hasOrder) {
      return Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ProductItemInOrder(imagePath: 'images/product.png', title: 'Zamzam Premium EgyptianWhite Rice 1kg Single', price: '250'),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 2,
              color: gray,
            ),
            itemCount: 10,
          ),

          orderItem(context: context),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Image.asset('images/no_data.png'),
            height24,
            Text(
              S.of(context).your_orders_yet,
              style: text16W600(context),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget(context);
  }



  Widget orderItem({required context}) => Padding(
        padding: const EdgeInsetsDirectional.only(
          end: 20.0,
          start: 20.0,
          top: 20,
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Card(
              color: white,
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.all(20),
                    child: Container(
                      width: fullWidth(context: context),
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).order_summary,
                            style: text16W600(context),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('product name (1x)'),
                                Text('350 \$'),
                              ],
                            ),
                            itemCount: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Divider(
                              height: 2.0,
                              color: gray,
                              thickness: 1.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).total_price),
                              const Text('350 \$'),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: defaultMaterialButton(
                                onPressed: () {},
                                text: S.of(context).checkout_now,
                                width: 170.0,
                                widget: Container()),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
