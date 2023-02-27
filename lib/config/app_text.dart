import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';

class AppText {
  /// For Title Text
  static titleText(
      {String? title,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight,
      TextOverflow? textOverflow,
      int? maxLine}) {
    return AutoSizeText(
      title ?? "",
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppColorSets.textBlueColor,
      ),
    );
  }

  static subTitleText(
      {String? subTitle,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight,
      TextOverflow? textOverflow,
      int? maxLine}) {
    return AutoSizeText(
      subTitle ?? "",
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColorSets.textGreyColor,
      ),
    );
  }
}
