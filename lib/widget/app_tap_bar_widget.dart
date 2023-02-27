import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class AppTabBarWidget extends StatelessWidget {
  final String? title;
  final int? length;
  final List<Widget>? tabs;
  final List<Widget>? childrenItem;
  final List<Widget>? childrenDate;
  const AppTabBarWidget({
    super.key,
    this.title,
    this.length,
    this.tabs,
    this.childrenItem,
    this.childrenDate,
  });

  @override
  Widget build(BuildContext context) {
    final isLangSelected = LanguageCode.KH_CODE == context.locale.languageCode;
    return DefaultTabController(
      length: length ?? 0,
      child: AppPlainPageWidget(
        title: title,
        bodyPadding: EdgeInsets.zero,
        bottom: TabBar(
          // isScrollable: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: AppColorSets.backgroundGreyColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          splashBorderRadius: BorderRadius.circular(10.0),
          unselectedLabelStyle: TextStyle(
            fontFamily: isLangSelected ? "KantumruyPro" : "KantumruyPro",
            color: AppColorSets.textBlackColor,
          ),
          labelStyle: TextStyle(
            fontFamily: isLangSelected ? "KantumruyPro" : "KantumruyPro",
            fontWeight: FontWeight.bold,
            color: AppColorSets.textBlackColor,
          ),
          labelColor: AppColorSets.textBlackColor,
          tabs: tabs ?? [],
        ),
        bodyChild: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: childrenDate ?? [],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: TabBarView(
                children: childrenItem ?? [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
