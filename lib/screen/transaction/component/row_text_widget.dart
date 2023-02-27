import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class RowTextWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final double? fontSize;
  const RowTextWidget({
    Key? key,
    this.title,
    this.value,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.titleText(
            fontSize: fontSize,
            color: AppColorSets.backgroundBlackColor,
            title: title ?? "",
          ),
          AppText.titleText(
            fontSize: fontSize,
            color: AppColorSets.backgroundBlackColor,
            title: value ?? "",
          ),
        ],
      ),
    );
  }
}
