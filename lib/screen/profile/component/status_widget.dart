import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/screen/profile/component/status_item_widget.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppText.subTitleText(subTitle: "Status"),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: statusData.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: StatusItemWidget(
                    onTap: () {
                      print("Status: ${e.title}");
                    },
                    title: e.title,
                    backgroundColor: e.backgroundColor,
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
