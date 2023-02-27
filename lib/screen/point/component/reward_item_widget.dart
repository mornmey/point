import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_button_sheet.dart';
import 'package:horpao_point/widget/app_card_list_widget.dart';

class RewardItemWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const RewardItemWidget({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        children: List.generate(orderItem.length, (index) {
          final e = orderItem[index];
          return Visibility(
            visible: e.qty == null,
            replacement: const SizedBox(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AppCardListWidget(
                onTap: () {
                  appBottomSheet(
                    scaffoldKey: scaffoldKey,
                    context: context,
                    orderItem: e,
                  );
                },
                color: AppColorSets.backgroundGreyColor,
                img: e.img,
                title: e.title,
                subtitle: "1",
                point: e.point,
              ),
            ),
          );
        }),
      ),
    );
  }
}
