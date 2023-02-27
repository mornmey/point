import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_button_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

Future appBottomSheet({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext context,
  OrderItem? orderItem,
}) {
  final size = MediaQuery.of(context).size;
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    constraints: BoxConstraints(
      maxHeight: size.height - scaffoldKey.currentState!.appBarMaxHeight!,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return Container(
        color: AppColorSets.backgroundWhiteColor,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    visible: true,
                    replacement: const SizedBox(),
                    child: Container(
                      height: size.height * 0.4,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(18),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            orderItem?.img ?? "",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: AppText.titleText(
                                title: orderItem?.title ?? "",
                                fontSize: 16,
                                maxLine: 3,
                                color: AppColorSets.textBlackColor,
                              ),
                            ),
                            AppCard(
                              radius: 15,
                              color: AppColorSets.backgroundDarkOrangeColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 8,
                              ),
                              child: AppText.titleText(
                                title: orderItem!.qty != null
                                    ? "x ${orderItem.qty}"
                                    : "${orderItem.point}",
                                fontSize: 16,
                                color: AppColorSets.textWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    buttonTxt: LocaleKeys.cancel.tr().toUpperCase(),
                    onPressed: () => router.pop(context),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                router.pop(context);
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColorSets.backgroundWhiteColor,
              ),
            ),
          ],
        ),
      );
    },
  );
}
