import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class AppPlainPageWidget extends StatelessWidget {
  final String? title;
  final Widget? titleChild;
  final bool? allowedBack;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final EdgeInsets bodyPadding;
  final Widget? bodyChild;
  final Widget? fab;
  final Widget? bottomSheet;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? fabLocation;
  final Color? backgroundColor;

  const AppPlainPageWidget({
    Key? key,
    this.scaffoldKey,
    this.bottomSheet,
    this.title,
    this.titleChild,
    this.allowedBack,
    this.centerTitle,
    this.actions,
    this.bottom,
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    this.bodyChild,
    this.fab,
    this.bottomNavigationBar,
    this.fabLocation,
    this.backgroundColor,
  })  : assert(title == null || titleChild == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleWidget = Visibility(
      visible: title != null,
      replacement: titleChild ?? Container(),
      child: AppText.titleText(
        fontSize: 18,
        color: AppColorSets.backgroundBlackColor,
        title: title,
      ),
    );

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      key: scaffoldKey,
      backgroundColor: backgroundColor ?? AppColorSets.backgroundWhiteColor,
      bottomSheet: bottomSheet,
      appBar: AppBar(
        backgroundColor: AppColorSets.backgroundWhiteColor,
        elevation: 0,
        leadingWidth: allowedBack == false ? 0 : 56,
        toolbarHeight: allowedBack == false ? 80 : 56,
        centerTitle: centerTitle,
        leading: Visibility(
          visible: allowedBack ?? true,
          replacement: Container(
            width: 0,
          ),
          child: IconButton(
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              size: 20,
              color: AppColorSets.backgroundBlackColor,
            ),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        title: titleWidget,
        actions: actions,
        bottom: bottom,
      ),
      body: body(context),
      floatingActionButtonLocation: fabLocation,
      floatingActionButton: fab,
    );
  }

  Widget body(BuildContext _) =>
      Padding(padding: bodyPadding, child: bodyChild);
}

class AppPlainPageWithSingleScrollWidget extends AppPlainPageWidget {
  final Widget? belowWidget;
  final EdgeInsets? padding;
  final FloatingActionButton? fab;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final int? flex;

  const AppPlainPageWithSingleScrollWidget({
    super.key,
    this.scaffoldKey,
    String? title,
    Widget? titleChild,
    Widget? bodyChild,
    bool? allowedBack,
    bool? centerTitle,
    Color? backgroundColor,
    this.belowWidget,
    this.padding,
    this.fab,
    this.actions,
    this.bottomNavigationBar,
    this.flex,
  }) : super(
          bottomNavigationBar: bottomNavigationBar,
          actions: actions,
          scaffoldKey: scaffoldKey,
          title: title,
          titleChild: titleChild,
          bodyChild: bodyChild,
          allowedBack: allowedBack,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
        );

  @override
  Widget body(_) {
    return Column(
      children: [
        Expanded(
          flex: flex ?? 1,
          child: SingleChildScrollView(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: bodyChild ?? Container(),
          ),
        ),
        belowWidget ?? Container(),
      ],
    );
  }
}
