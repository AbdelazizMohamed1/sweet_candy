import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/shared/const_assets.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../../generated/l10n.dart';
import '../../../shared/colors.dart';
import '../../../shared/widgets/back_arrow_text_icon.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackArrowTextIcon(
                  text: S.of(context).notification,
                  hasIcon: true,
                  hasText: true,
                  iconWidget: SvgPicture.asset(ConstAssets.notification),
                  hasArrow: true),
              height20,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => notificationItem(context: context),
                separatorBuilder: (context, index) => height16,
                itemCount: 10,
              ),
              height20,
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationItem({required context}) => Container(
        height: 120,
        width: fullWidth(context: context),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Get a discount for your next order',
              style: text16W400(context),
            ),
            Text(
              'From 6 Hours',
              style: text9W300(context),
            ),
            Text(
              'You have obtained 30 points, you can use it for your next order and get a 30% off.',
              style: text11W300(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
}
