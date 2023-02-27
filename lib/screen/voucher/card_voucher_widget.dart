import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/screen/voucher/component/history_item_widget.dart';
import 'package:horpao_point/screen/voucher/component/voucher_item_widget.dart';
import 'package:horpao_point/widget/app_end_date_button.dart';
import 'package:horpao_point/widget/app_start_date_button.dart';
import 'package:horpao_point/widget/app_tap_bar_widget.dart';

class CardVoucherWidget extends ConsumerWidget {
  const CardVoucherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppTabBarWidget(
      length: 2,
      title: LocaleKeys.card_voucher.tr().toUpperCase(),
      tabs: [
        Tab(text: LocaleKeys.card_voucher.tr()),
        Tab(text: LocaleKeys.history.tr()),
      ],
      childrenDate: const [
        AppStartDateButton(),
        AppEndDateButton(),
      ],
      childrenItem: const [
        /// Card Voucher
        VoucherItemWidget(),

        /// History
        HistoryItemWidget(),
      ],
    );
  }
}
