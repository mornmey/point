import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class CardItemWidget extends StatelessWidget {
  final String? title;
  final String? img;
  const CardItemWidget({
    Key? key,
    this.title,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      img ?? "lib/assets/images/item.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppText.titleText(
                  color: AppColorSets.backgroundBlueColor,
                  title: title,
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 3,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(60),
            ),
            color: AppColorSets.backgroundDarkOrangeColor,
          ),
          child: AppText.subTitleText(
            subTitle: "12",
            color: AppColorSets.textWhiteColor,
          ),
        ),
      ],
    );
  }
}
