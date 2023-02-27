import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/screen/item/component/category_item_widget.dart';
import 'package:horpao_point/screen/item/component/item_card_widget.dart';
import 'package:horpao_point/widget/app_button_sheet.dart';
import 'package:horpao_point/widget/app_card_widget.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class ItemPackageWidget extends ConsumerWidget {
  const ItemPackageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return AppPlainPageWidget(
      scaffoldKey: scaffoldKey,
      title: LocaleKeys.item_package.tr().toUpperCase(),
      bodyChild: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColorSets.backgroundBlueColor,
            ),
            child: AppCard(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(2),
              width: size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: orderItem.map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {},
                        child: CategoryItemWidget(
                          img: e.img,
                          title: e.title,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 26),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: List.generate(orderItem.length, (index) {
                  final e = orderItem[index];
                  return Visibility(
                    visible: e.qty != null,
                    replacement: const SizedBox(),
                    child: ItemCardWidget(
                      onTap: () {
                        appBottomSheet(
                          scaffoldKey: scaffoldKey,
                          context: context,
                          orderItem: e,
                        );
                      },
                      img: e.img,
                      title: e.title,
                      price: e.price,
                      qty: e.qty,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
