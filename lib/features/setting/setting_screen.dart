import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/features/setting/about_and_help/about_and_help_screen.dart';
import 'package:sweet_candy/features/setting/points/points_screen.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/widgets/back_arrow_text_icon.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';
import '../../shared/const_assets.dart';
import '../../shared/height.dart';
import '../home/widgets/dialog.dart';
import 'contact_us/contact_us_screen.dart';
import 'notification/notification_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogComponent(
          text: S.of(context).are_you_sure_delete_account,
          buttonTwo: S.of(context).delete,
          onPressed: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackArrowTextIcon(
                text: S.of(context).settings,
                hasIcon: false,
                hasText: true,
                hasArrow: true),
            height85,
            SizedBox(
              width: fullWidth(context: context) * 0.39,
              child: Column(
                children: [
                  settingItem(
                    text: S.of(context).edit_personal_data,
                    imagePath: ConstAssets.edit,
                    onTap: () {},
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).points,
                    imagePath: ConstAssets.coins,
                    onTap: () {
                      Components.navigateTo(context: context, widget: const PointsScreen());
                    },
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).get_help,
                    imagePath: ConstAssets.help,
                    onTap: () {
                      Components.navigateTo(
                          context: context,
                          widget: AboutAndHelpScreen(
                            title: S.of(context).we_are_here_to_help_you,
                            contain:
                                'Learn about the history, usage and variations of Lorem Ipsum, the industry\'s standard dummy text \'for printing and typesetting. Generate your own Lorem IpsumLearn about the history, usage and variations of Lorem Ipsum, the industry\'s standard dummy text \'for printing and typesetting. Generate your own Lorem IpsumLearn about the history, usage and variations of Lorem Ipsum, the industry\'s standard dummy text for printing and typesetting. Generate your own Lorem IpsumLearn about the .',
                          ));
                    },
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).notification,
                    imagePath: ConstAssets.notification,
                    onTap: () {
                      Components.navigateTo(context: context, widget:  NotificationScreen());
                    },
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).contact_us,
                    imagePath: ConstAssets.phone,
                    onTap: () {
                      Components.navigateTo(context: context, widget:  ContactUsScreen());
                    },
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).about_us,
                    imagePath: ConstAssets.about,
                    onTap: () {
                      Components.navigateTo(
                          context: context,
                          widget: AboutAndHelpScreen(
                            title: S.of(context).about_our_app,
                            contain:
                            'Learn about the history, usage and variations of Lorem Ipsum, the industry\'s standard dummy text \'for printing and typesetting. Generate your own Lorem IpsumLearn about the history, usage and variations of Lorem Ipsum, the industry\'s standard dummy text \'for printing and typesetting. Generate your own Lorem IpsumLearn about the history, usage and variations of Lorem Ipsum, the industry\'s standard dummy text for printing and typesetting. Generate your own Lorem IpsumLearn about the .',
                          ));
                    },
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).language,
                    imagePath: ConstAssets.language,
                    onTap: () {},
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).checkout,
                    imagePath: ConstAssets.checkOut,
                    onTap: () {},
                  ),
                  height32,
                  settingItem(
                    text: S.of(context).delete_account,
                    imagePath: ConstAssets.delete,
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget settingItem(
          {required String text,
          required String imagePath,
          required void Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(imagePath),
            width20,
            Text(text),
          ],
        ),
      );
}
