import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/utils/exception.dart';
import 'package:horpao_point/widget/app_alert_dialog.dart';

/// SnackBar
showSnackBar(
    {required BuildContext context,
    String? msg,
    Color snackBarColor = Colors.black}) {
  Flushbar(
    message: msg,
    duration: const Duration(seconds: 2),
    backgroundColor: snackBarColor,
    animationDuration: const Duration(milliseconds: 250),
  ).show(context);
}

Future<dynamic> showErrorDialog({
  required AppException e,
  required BuildContext context,
  required Function onRetry,
}) async {
  if (e is NoInternetException ||
      e is OtherExceptions ||
      e is SocketException) {
    return showConfirmationAlertDialog(
      title: e.title,
      description: e.message,
      context: context,
      confirmBtn: AppAlertDialogButtonModel(
        buttonTxt: LocaleKeys.retry.tr(),
        onPressed: () {
          router.pop(context);
          onRetry();
        },
      ),
    );
  }
}

Future<dynamic> showConfirmationAlertDialog({
  String title = "Title",
  String description = "Description",
  required BuildContext context,
  required AppAlertDialogButtonModel confirmBtn,
}) async {
  return showPlatformDialog(
    context: context,
    builder: (_) => AppAlertDialogWidget(
      title: title,
      description: description,
      buttons: [
        AppAlertDialogButtonModel(
          buttonTxt: LocaleKeys.cancel.tr(),
          txtColor: AppColorSets.backgroundDarkOrangeColor,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        confirmBtn,
      ],
    ),
  );
}
