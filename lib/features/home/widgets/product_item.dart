import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/height.dart';
import '../../../shared/text.dart';
import '../../../shared/width.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 0;
  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth(context: context) / 2,
      child: Card(
        color: white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('images/product1.png')),
              height16,
              const Text('Heinz Tomato Sauce 360 gm Save 1 \$'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _decrementQuantity();
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                  ),
                  const Spacer(),
                   Text('$quantity'),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      _incrementQuantity();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Text(
                '235 \$',
                style: text10W700(context),
              ),
              height16,
              Row(
                children: [
                  Text(
                    '250',
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: green,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: green,
                        decorationThickness: 2),
                  ),
                  width10,
                  Text(
                    '10%',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: green,
                    ),
                  ),
                  width10,
                  Text(
                    'OFF',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: green,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
