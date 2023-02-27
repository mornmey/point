import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/model/models.dart';

class AppTheme {
  static theme(String langCode) {
    String fontFamily;
    if (langCode == LanguageCode.KH_CODE) {
      fontFamily = "KantumruyPro";
    } else {
      fontFamily = "KantumruyPro";
    }
    return ThemeData(fontFamily: fontFamily).copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColorSets.backgroundBlueColor,
      ),
    );
  }
}
