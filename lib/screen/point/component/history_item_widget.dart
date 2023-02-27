import 'package:flutter/material.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_list_item_widget.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        children: transactionData.map((e) {
          return Visibility(
            visible: e.isIncome == true,
            replacement: Container(),
            child: AppListItemWidget(
              onTap: () {
                print("Payment: all");
              },
              padding: const EdgeInsets.symmetric(vertical: 5),
              title: e.title,
              subTitle: e.dateTime,
              fee: e.fee,
              isIncome: e.isIncome!,
            ),
          );
        }).toList(),
      ),
    );
  }
}
