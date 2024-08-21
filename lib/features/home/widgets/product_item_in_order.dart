import 'package:flutter/material.dart';
import '../../../shared/width.dart';

class ProductItemInOrder extends StatefulWidget {
   ProductItemInOrder({super.key, required this.imagePath, required this.title, required this.price});
  final String imagePath;
   final String title;
   final String price;

  @override
  State<ProductItemInOrder> createState() => _ProductItemInOrderState();
}

class _ProductItemInOrderState extends State<ProductItemInOrder> {
  int quantity = 2;
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
    return  Container(
      height: 90,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image(image: AssetImage(widget.imagePath)),
          width20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  maxLines: 3,
                ),
                Text('${widget.price} \$')
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _decrementQuantity();
                },
                icon: const Icon(Icons.remove),
              ),
               Text('$quantity'),
              IconButton(
                onPressed: () {
                  _incrementQuantity();
                },
                icon: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
