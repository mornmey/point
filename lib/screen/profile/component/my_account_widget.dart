import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/routes.dart';

class MyAccountWidget extends StatelessWidget {
  const MyAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppText.subTitleText(subTitle: "My Account"),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              router.navigateTo(context, AppRoutes.changeLang);
              print("Switch Account");
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppText.titleText(
                fontSize: 18,
                color: AppColorSets.backgroundBlueColor,
                title: LocaleKeys.change_language.tr(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              print("Log Out");
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppText.titleText(
                fontSize: 18,
                color: AppColorSets.backgroundDarkOrangeColor,
                title: LocaleKeys.logout.tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
