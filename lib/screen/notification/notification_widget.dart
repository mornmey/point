import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/screen/notification/component/announcement_item_widget.dart';
import 'package:horpao_point/screen/notification/component/transactions_item_widget.dart';
import 'package:horpao_point/widget/app_end_date_button.dart';
import 'package:horpao_point/widget/app_start_date_button.dart';
import 'package:horpao_point/widget/app_tap_bar_widget.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTabBarWidget(
      length: 2,
      title: LocaleKeys.notifications.tr().toUpperCase(),
      tabs: [
        Tab(text: LocaleKeys.transactions.tr()),
        Tab(text: LocaleKeys.announcements.tr()),
      ],
      childrenDate: const [
        AppStartDateButton(),
        AppEndDateButton(),
      ],
      childrenItem: const [
        /// Transactions
        TransactionsItemWidget(),

        /// Announcements
        AnnouncemenItemWidget(),
      ],
    );
  }
}
