import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/app_list_item_widget.dart';

class TransactionsItemWidget extends StatelessWidget {
  const TransactionsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        children: [
          Visibility(
            visible: transactionData.first.dateTime == "10:40 31/01/2023",
            replacement: Container(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AppText.subTitleText(subTitle: "JANUARY"),
              ),
            ),
          ),
          Column(
            children: transactionData.map((e) {
              return Visibility(
                visible: e.isIncome == true,
                replacement: Container(),
                child: AppListItemWidget(
                  onTap: () {
                    print("Payment: all");
                  },
                  title: e.title,
                  subTitle: e.dateTime,
                  fee: e.fee,
                  isIncome: e.isIncome!,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
