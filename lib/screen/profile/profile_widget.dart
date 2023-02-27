import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/routes.dart';
import 'package:horpao_point/screen/profile/component/list_item_widget.dart';
import 'package:horpao_point/screen/profile/component/dashboard_widget.dart';
import 'package:horpao_point/screen/profile/component/my_account_widget.dart';
import 'package:horpao_point/screen/profile/component/status_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPlainPageWithSingleScrollWidget(
      padding: EdgeInsets.zero,
      title: LocaleKeys.profile.tr().toUpperCase(),
      bodyChild: Column(
        children: [
          /// Profile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: AppCard(
              color: AppColorSets.backgroundGreyColor,
              padding: EdgeInsets.zero,
              radius: 15,
              inkWellRadius: 15,
              onTap: () {
                router.navigateTo(context, AppRoutes.edit_profile);
              },
              child: const ListItemWidget(
                title: "ម៉ន ម៉ី",
                subTitle: "Morn Mey",
                trailingIcon: FontAwesomeIcons.pen,
                trailingBackgroundColor: AppColorSets.backgroundBlueColor,
              ),
            ),
          ),

          /// Status
          const StatusWidget(),
          const SizedBox(height: 16),

          /// Dashboard
          const DashBoardWidget(),
          const SizedBox(height: 16),

          /// My Account
          const MyAccountWidget(),
        ],
      ),
    );
  }
}
