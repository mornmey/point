import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class AppListItemWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? fee;
  final bool isIncome;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  const AppListItemWidget({
    Key? key,
    this.title,
    this.subTitle,
    this.fee,
    this.isIncome = false,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: AppCard(
        color: AppColorSets.backgroundGreyColor,
        padding: EdgeInsets.zero,
        radius: 15,
        inkWellRadius: 15,
        onTap: onTap,
        child: ListTile(
          minLeadingWidth: 30,
          leading: const Icon(
            FontAwesomeIcons.moneyCheckDollar,
            color: AppColorSets.backgroundBlueColor,
          ),
          title: AppText.titleText(
            fontSize: 16,
            color: AppColorSets.backgroundBlackColor,
            title: title,
          ),
          subtitle: AppText.subTitleText(subTitle: subTitle),
          trailing: Text(
            "$fee\$",
            style: TextStyle(
              color: isIncome
                  ? AppColorSets.textGreenColor
                  : AppColorSets.textRedColor,
            ),
          ),
        ),
      ),
    );
  }
}
