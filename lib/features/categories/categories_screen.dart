import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/width.dart';
import '../../shared/widgets/back_arrow_text_icon.dart';
import '../home/widgets/product_item.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackArrowTextIcon(
                hasIcon: false,
                hasText: true,
                hasArrow: true,
                text: title,
              ),
              height40,
              GridView.builder(
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: fullWidth(context: context)/2,
                    childAspectRatio: ((fullWidth(context: context) / 2 )  - 20 ) / 280 ),
                itemBuilder: (context, index) => const ProductItem(),
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
