import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/default_material_button.dart';
import 'package:sweet_candy/shared/widgets/hint_text.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../../../generated/l10n.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/const_assets.dart';
import '../../widgets/dialog.dart';
import '../../widgets/icon_and_text.dart';

class ProfileBodyScreen extends StatelessWidget {
  const ProfileBodyScreen({super.key});
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogComponent(text: S.of(context).are_you_sure_logout, buttonTwo: S.of(context).logout,onPressed: () {
        },);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height85,
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ConstAssets.user),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          ),
          height64,
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconAndText(
                  text: S.of(context).name,
                  imagePath: 'images/user_name.svg',
                ),
                height10,
                Text(
                  'Abdelaziz Mohamed Ramadan',
                  style: text16W400(context),
                ),
                height20,
                IconAndText(
                  text: S.of(context).phone,
                  imagePath: 'images/phone.svg',
                ),
                height10,
                Text(
                  '+970593114035',
                  style: text16W400(context),
                ),
                height20,
              ],
            ),
          ),
          height64,
          Container(
            height: 50,
            width: fullWidth(context: context),
            decoration: BoxDecoration(
                border: Border.all(color: mainColor),
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/sign_out.svg'),
                  width10,
                  Text(
                    S.of(context).sign_out,
                    style: text16W600(context, color: mainColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
