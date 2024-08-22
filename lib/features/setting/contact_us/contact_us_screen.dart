import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../../../shared/const_assets.dart';
import '../../../shared/height.dart';
import '../../../shared/text.dart';
import '../../../shared/widgets/back_arrow_text_icon.dart';
import '../../home/widgets/icon_and_text.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({super.key});
   final Uri _url = Uri.parse('https://wa.me/+201060142496');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
           mainAxisSize: MainAxisSize.min,

          children: [
            BackArrowTextIcon(
                text: S.of(context).contact_us,
                hasIcon: false,
                hasText: true,
                hasArrow: true),
           const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(50),
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
                    child: const Image(image: AssetImage(ConstAssets.contactUs))),
                height20,
                IconAndText(
                  text: S.of(context).phone,
                  imagePath: 'images/phone.svg',
                ),
                height10,
                SelectableText(
                  '+970593114035',
                  style: text16W400(context),
                ),
                height20,
                IconAndText(
                  text: S.of(context).email,
                  imagePath: ConstAssets.shopName,
                ),
                height10,
                SelectableText(
                    'Candy45002@gmail.com',
                    style: text16W400(context),
                ),

              ],
            ),
            height20,
            InkWell(
                onTap: () {
                  _launchUrl();
                },
                child: SvgPicture.asset(ConstAssets.whatsapp,width: 100,height: 100,)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
