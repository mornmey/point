import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class CategoryItemWidget extends StatelessWidget {
  final String? img;
  final String? title;
  const CategoryItemWidget({
    Key? key,
    this.img,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                  img ?? "",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        AppText.titleText(
          title: title,
          fontSize: 14,
          color: AppColorSets.textBlackColor,
        ),
      ],
    );
  }
}
