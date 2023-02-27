import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/screen/voucher/component/column_flex_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class VoucherItemWidget extends StatelessWidget {
  const VoucherItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10,bottom: 25),
      child: Column(
        children: List.generate(cardVoucher.length, (index) {
          final e = cardVoucher[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: AppCard(
              width: size.width,
              height: size.height * 0.14,
              color: e.color ?? AppColorSets.backgroundGreenColor,
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppText.titleText(
                      title:
                          e.amount != null ? "\$${e.amount}" : "${e.discount}%",
                      fontSize: 30,
                      textAlign: TextAlign.center,
                      color: AppColorSets.textWhiteColor,
                    ),
                  ),
                  const ColumnFlexWidget(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText.titleText(
                                title: e.name,
                                color: AppColorSets.textWhiteColor,
                              ),
                              AppText.subTitleText(
                                subTitle: e.description,
                                color: AppColorSets.textWhiteColor
                                    .withOpacity(0.6),
                                maxLine: 2,
                                textOverflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          AppText.titleText(
                            title: DateFormat('dd MMM yyyy').format(
                              e.expiryDate!,
                            ),
                            fontSize: 14,
                            color: AppColorSets.textWhiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColorSets.backgroundWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
