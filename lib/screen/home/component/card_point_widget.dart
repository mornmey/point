import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class CardPointWidget extends StatelessWidget {
  final String? title;
  final String? img;

  const CardPointWidget({
    Key? key,
    this.title,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppText.titleText(
          color: AppColorSets.backgroundBlueColor,
          textAlign: TextAlign.center,
          title: title,
        ),
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    img ?? "",
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColorSets.backgroundDarkOrangeColor,
                ),
                child: AppText.titleText(
                  title: "1200",
                  color: AppColorSets.textWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
