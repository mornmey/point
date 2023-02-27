import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class ListItemWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? trailingBackgroundColor;
  final IconData? trailingIcon;
  final IconData? icons;
  final String? title;
  final String? subTitle;
  final String? trailingString;
  const ListItemWidget({
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.trailingBackgroundColor,
    this.trailingIcon,
    this.icons,
    this.title,
    this.subTitle,
    this.trailingString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Visibility(
        visible: subTitle == null,
        replacement: const CircleAvatar(
          radius: 30,
          backgroundColor: AppColorSets.colorPrimaryBlue,
          backgroundImage: AssetImage("lib/assets/images/profile.png"),
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: backgroundColor ?? AppColorSets.backgroundGreenColor,
          child: Icon(
            icons ?? FontAwesomeIcons.solidCreditCard,
            size: 20,
            color: AppColorSets.backgroundWhiteColor,
          ),
        ),
      ),
      title: AppText.titleText(
          fontSize: 18, color: AppColorSets.backgroundBlackColor, title: title ?? ""),
      subtitle: Visibility(
        visible: subTitle != null,
        replacement: Container(),
        child: AppText.subTitleText(subTitle: subTitle ?? ""),
      ),
      trailing: Visibility(
        visible: trailingString != null,
        replacement: Icon(
          trailingIcon ?? FontAwesomeIcons.angleRight,
          size: 20,
          color: trailingBackgroundColor ?? AppColorSets.backgroundGreyColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: trailingBackgroundColor ??
                AppColorSets.backgroundBlueColor.withOpacity(0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.subTitleText(
                  color: AppColorSets.backgroundWhiteColor,
                  subTitle: trailingString ?? "",
                ),
                Icon(
                  trailingIcon ?? FontAwesomeIcons.angleRight,
                  size: 20,
                  color: AppColorSets.backgroundWhiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
