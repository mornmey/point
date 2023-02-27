import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppDialog extends StatefulWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? content;
  final List<Widget>? actions;
  final EdgeInsets? insetPadding;

  const AppDialog({
    Key? key,
    this.title: "Title",
    this.titleWidget,
    this.content,
    this.actions,
    this.insetPadding,
  }) : super(key: key);

  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      material: (context, platform) => MaterialAlertDialogData(
        insetPadding: widget.insetPadding,
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: widget.content,
      actions: widget.actions,
    );
  }
}
