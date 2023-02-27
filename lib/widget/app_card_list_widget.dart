import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class AppCardListWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? price;
  final String? point;
  final Color? color;
  final VoidCallback? onTap;
  const AppCardListWidget({
    Key? key,
    this.img,
    this.title,
    this.subtitle,
    this.price,
    this.point,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: color ?? AppColorSets.backgroundWhiteColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      radius: 15,
      inkWellRadius: 15,
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  img ?? "",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: AppText.titleText(
          title: title,
          fontSize: 16,
          color: AppColorSets.textBlackColor,
        ),
        subtitle: AppText.subTitleText(
          subTitle: "x $subtitle",
        ),
        trailing: Visibility(
          visible: point == null,
          replacement: AppCard(
            radius: 15,
            color: AppColorSets.backgroundDarkOrangeColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: AppText.titleText(
              title: point,
              fontSize: 16,
              color: AppColorSets.textWhiteColor,
            ),
          ),
          child: AppText.titleText(
            title: "\$ $price",
            fontSize: 16,
            color: AppColorSets.textBlackColor,
          ),
        ),
      ),
    );
  }
}
