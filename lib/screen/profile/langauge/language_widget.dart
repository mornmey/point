import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/screen/profile/langauge/component/language_item_widget.dart';
import 'package:horpao_point/utils/utils.dart';
import 'package:horpao_point/widget/app_alert_dialog.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPlainPageWidget(
      title: LocaleKeys.change_language.tr().toUpperCase(),
      bodyPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      bodyChild: LanguageItemWidget(
        onChangeLanguage: (languageCode) async {
          showConfirmationAlertDialog(
            context: context,
            title: LocaleKeys.confirm.tr(),
            description: LocaleKeys.this_app_need_to_restarted.tr(),
            confirmBtn: AppAlertDialogButtonModel(
              txtColor: AppColorSets.backgroundBlueColor,
              buttonTxt: LocaleKeys.ok.tr(),
              onPressed: () {
                context.setLocale(Locale(languageCode));
                RestartApp.restartApp(context);
              },
            ),
          );
        },
      ),
    );
  }
}
