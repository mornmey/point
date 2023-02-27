import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class LanguageItemWidget extends StatelessWidget {
  final Function(String) onChangeLanguage;

  const LanguageItemWidget({
    Key? key,
    required this.onChangeLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemLanguage(
          imageAsset: "lib/assets/images/flag_of_cambodia_circle.jpg",
          language: "ភាសាខ្មែរ",
          languageCode: LanguageCode.KH_CODE,
          onChangeLanguage: onChangeLanguage,
        ),
        ItemLanguage(
          imageAsset: "lib/assets/images/flag_of_usa_circle.png",
          language: "English",
          languageCode: LanguageCode.EN_CODE,
          onChangeLanguage: onChangeLanguage,
        ),
      ],
    );
  }
}

class ItemLanguage extends StatelessWidget {
  final String imageAsset;
  final String language;
  final String languageCode;
  final Function(String) onChangeLanguage;
  const ItemLanguage({
    Key? key,
    required this.imageAsset,
    required this.language,
    required this.languageCode,
    required this.onChangeLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLangSelected = languageCode == context.locale.languageCode;
    return AppCard(
      radius: 15,
      inkWellRadius: 15,
      elevation: 2,
      color: AppColorSets.backgroundWhiteColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTap: () => isLangSelected ? null : onChangeLanguage(languageCode),
      child: ListTile(
        leading: CircleAvatar(
          child: Container(
            decoration: BoxDecoration(
              color: AppColorSets.backgroundBlueColor,
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: AppColorSets.backgroundBlueColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        title: Text(
          language,
          style: TextStyle(
            color: isLangSelected
                ? AppColorSets.textBlueColor
                : AppColorSets.textBlackColor,
          ),
        ),
        trailing: Icon(
          isLangSelected
              ? FontAwesomeIcons.circleCheck
              : FontAwesomeIcons.circle,
          size: 20,
          color: isLangSelected
              ? AppColorSets.backgroundBlueColor
              : AppColorSets.backgroundGreyColor,
        ),
      ),
    );
  }
}
