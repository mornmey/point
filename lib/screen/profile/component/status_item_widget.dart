import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class StatusItemWidget extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  const StatusItemWidget({
    Key? key,
    this.title,
    this.onTap,
    this.backgroundColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor ?? AppColorSets.backgroundBlueColor.withOpacity(0.8),
        ),
        child: Center(
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: AppText.subTitleText(
              color: AppColorSets.backgroundWhiteColor,
              subTitle: title ?? "",
            ),
          ),
        ),
      ),
    );
  }
}
