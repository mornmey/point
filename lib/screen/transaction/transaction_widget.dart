import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_card_list_widget.dart';
import 'package:horpao_point/screen/transaction/component/row_flex_widget.dart';
import 'package:horpao_point/screen/transaction/component/row_text_widget.dart';
import 'package:horpao_point/widget/app_button_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';
import 'package:horpao_point/widget/app_progress_hud_widget.dart';
import 'package:horpao_point/widget/profile_display_widget.dart';

class TransactionWidget extends ConsumerStatefulWidget {
  const TransactionWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TransferWidgetState();
}

class _TransferWidgetState extends ConsumerState<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return AppProgressHUD(
      inAsyncCall: false,
      child: AppPlainPageWithSingleScrollWidget(
        title: LocaleKeys.scan_qr.tr().toUpperCase(),
        bodyChild: AppCard(
          radius: 16,
          color: AppColorSets.backgroundGreyColor,
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProfileDisplayWidget(
                      title: "Hor Pao",
                      subtitle: "Hor Pao - MS",
                    ),
                    AppCard(
                      radius: 8,
                      elevation: 2,
                      color: AppColorSets.backgroundBlueColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: AppText.titleText(
                        fontSize: 16,
                        color: AppColorSets.backgroundWhiteColor,
                        title: LocaleKeys.balance.tr(),
                      ),
                    ),
                  ],
                ),
              ),
              const RowFlexWidget(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleText(
                      fontSize: 16,
                      color: AppColorSets.backgroundBlackColor,
                      title: LocaleKeys.my_order.tr(),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: orderItem
                          .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AppCardListWidget(
                                img: e.img,
                                title: e.title,
                                subtitle: e.qty,
                                price: e.price,
                              )))
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    RowTextWidget(
                      title: LocaleKeys.full_price.tr(),
                      value: "\$ 12.00",
                    ),
                    RowTextWidget(
                      title: LocaleKeys.discount.tr(),
                      value: "\$ 0.50",
                    ),
                    RowTextWidget(
                      fontSize: 24,
                      title: LocaleKeys.total.tr(),
                      value: "\$ 11.50",
                    ),
                    const Divider(
                      color: AppColorSets.backgroundBlueColor,
                    ),
                    RowTextWidget(
                      title: LocaleKeys.order_item.tr(),
                      value: "x 3",
                    ),
                    RowTextWidget(
                      title: LocaleKeys.order_time.tr(),
                      value: "27 Feb 2023 10:56 am",
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        belowWidget: AppButton(
          margin: const EdgeInsets.fromLTRB(16, 10, 16, 26),
          buttonTxt: LocaleKeys.confirm.tr(),
          onPressed: () {},
        ),
      ),
    );
  }
}
