import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/widget/app_dialog.dart';

class AppAlertDialogButtonModel {
  final String buttonTxt;
  final VoidCallback? onPressed;
  final Color? txtColor;

  AppAlertDialogButtonModel({required this.buttonTxt, this.txtColor, this.onPressed});
}

class AppAlertDialogWidget extends StatefulWidget {
  final String title;
  final String description;
  final List<AppAlertDialogButtonModel> buttons;

  const AppAlertDialogWidget({
    Key? key,
    this.title = "Title",
    this.description = "Description",
    this.buttons: const [],
  }) : super(key: key);

  @override
  _AppAlertDialogWidgetState createState() => _AppAlertDialogWidgetState();
}

class _AppAlertDialogWidgetState extends State<AppAlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    final defaultButtons = [
      AppAlertDialogButtonModel(
        buttonTxt: LocaleKeys.ok.tr(),
        onPressed: () => Navigator.pop(context),
      )
    ];

    return AppDialog(
      title: widget.title,
      content: Text(widget.description),
      actions: widget.buttons.isEmpty ? actions(defaultButtons) : actions(widget.buttons),
    );
  }

  List<Widget>? actions(List<AppAlertDialogButtonModel> buttons) {
    return buttons
        .map((b) => PlatformDialogAction(
            onPressed: b.onPressed,
            child: PlatformText(
              b.buttonTxt,
              style: TextStyle(
                color: b.txtColor ?? AppColorSets.backgroundBlueColor,
              ),
            )))
        .toList();
  }
}
