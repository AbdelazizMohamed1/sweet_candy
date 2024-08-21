import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/widgets/text_button_under_line.dart';
import 'package:sweet_candy/shared/widgets/text_under_line.dart';
import 'package:sweet_candy/shared/width.dart';
import '../../../../generated/l10n.dart';
import '../../widgets/product_item.dart';

class HomeBodyScreen extends StatelessWidget {
  HomeBodyScreen({super.key});
  final List<Color> buttonColors = [mainColor, pink, mainBlack];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: fullWidth(context: context),
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
                  Container(
                    child: defaultMaterialButton(
                      onPressed: () {},
                      text: 'order now',
                      widget: Container(),
                      color: mainColor,
                      width: fullWidth(context: context) / 3,
                      height: 30,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Image.asset('images/product.png'),
              const Spacer()
            ],
          ),
        ),
        height24,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: 90,
          width: fullWidth(context: context),
          decoration: BoxDecoration(
              color: pink, borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('images/clock.svg'),
              const Spacer(),
              Text(
                'Limited time offer\n2 days',
                style: text20W600(context, color: white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        height10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SvgPicture.asset('images/categories.svg'),
              TextButtonUnderLine(text: S.of(context).categories)
            ],
          ),
        ),
        height16,
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            child: ListView.separated(
              separatorBuilder: (context, index) => width10,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    print('Button $index pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColors[index % buttonColors.length],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Button $index',
                    style: text12W600(context, color: white),
                  ),
                );
              },
            ),
          ),
        ),
        height10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextUnderLine(text: S.of(context).most_popular_product),
        ),
        height10,
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 0.65
          ),
          itemBuilder: (context, index) => const ProductItem(),
          itemCount: 4,
          shrinkWrap: true,
         padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
         physics: const NeverScrollableScrollPhysics(),
        )
      ],
    );
  }

}
