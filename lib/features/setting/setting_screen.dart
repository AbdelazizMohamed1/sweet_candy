import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_candy/features/setting/about_and_help/about_and_help_screen.dart';
import 'package:sweet_candy/features/setting/manager/localization_cubit.dart';
import 'package:sweet_candy/features/setting/manager/localization_states.dart';
import 'package:sweet_candy/features/setting/points/points_screen.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/components/components.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/widgets/back_arrow_text_icon.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';
import '../../shared/const_assets.dart';
import '../../shared/height.dart';
import '../check_out/check_out_screen.dart';
import '../home/widgets/dialog.dart';
import 'contact_us/contact_us_screen.dart';
import 'edit_personal_data/edit_personal_data_screen.dart';
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
    return BlocConsumer<LocalizationCubit,LocalizationStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
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
                  width: fullWidth(context: context) * 0.45,
                  child: Column(
                    children: [
                      settingItem(
                        text: S.of(context).edit_personal_data,
                        imagePath: ConstAssets.edit,
                        onTap: () {
                          Components.navigateTo(
                              context: context, widget: EditPersonalDataScreen());
                        },
                      ),
                      height32,
                      settingItem(
                        text: S.of(context).points,
                        imagePath: ConstAssets.coins,
                        onTap: () {
                          Components.navigateTo(
                              context: context, widget:  PointsScreen());
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
                          Components.navigateTo(
                              context: context, widget: NotificationScreen());
                        },
                      ),
                      height32,
                      settingItem(
                        text: S.of(context).contact_us,
                        imagePath: ConstAssets.phone,
                        onTap: () {
                          Components.navigateTo(
                              context: context, widget: ContactUsScreen());
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
                        text: S.of(context).checkout,
                        imagePath: ConstAssets.checkOut,
                        onTap: () {
                          Components.navigateTo(context: context, widget:  CheckOutScreen());
                        },
                      ),
                      height32,
                      settingItem(
                        text: S.of(context).delete_account,
                        imagePath: ConstAssets.delete,
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                      ),
                      height32,
                      Row(
                        children: [
                          SvgPicture.asset(ConstAssets.language),
                          width16,
                          const LanguageRow(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },

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

class LanguageRow extends StatelessWidget {
  const LanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LocalizationCubit,LocalizationStates>(
      builder: (context, state) {
        LocalizationCubit cubit = BlocProvider.of(context);
        return  Container(
          width: fullWidth(context: context) * 0.35,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: mainBlack),
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Components.isArabic ? mainBlack : white),
                      elevation: WidgetStatePropertyAll(0)
                  ),

                  onPressed: () {
                    if(!Components.isArabic){
                      cubit.changeLanguageToArabic();
                    }
                  },
                  child: Text('Ar',style: text16W400(context,color: Components.isArabic ? white :mainBlack  ),),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Components.isArabic ? white : mainBlack),
                      elevation: WidgetStatePropertyAll(0)
                  ),

                  onPressed: () {
                    if(Components.isArabic){
                      cubit.changeLanguageToEnglish();
                    }
                  },
                  child: Text('En',style: text16W400(context,color: Components.isArabic ? mainBlack : white),),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}

