import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/screen/profile/component/list_item_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppText.subTitleText(subTitle: "Dashboard"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: AppCard(
            padding: EdgeInsets.zero,
            color: AppColorSets.backgroundGreyColor,
            radius: 15,
            inkWellRadius: 15,
            child: Column(
              children: dashboardData.map((e) {
                return AppCard(
                  color: AppColorSets.backgroundGreyColor,
                  padding: EdgeInsets.zero,
                  radius: 15,
                  inkWellRadius: 15,
                  onTap: () {
                    print("Dashboard: ${e.title}");
                  },
                  child: ListItemWidget(
                    backgroundColor: e.backgroundColor,
                    trailingBackgroundColor: e.trailingBackgroundColor,
                    icons: e.icons,
                    title: e.title,
                    trailingString: e.trailing,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
