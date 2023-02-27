import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class ItemCardWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? price;
  final String? qty;
  final VoidCallback? onTap;

  const ItemCardWidget({
    Key? key,
    this.img,
    this.title,
    this.price,
    this.qty,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppCard(
      radius: 20,
      inkWellRadius: 20,
      width: size.width * 0.28,
      color: AppColorSets.backgroundGreyColor,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
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
          const SizedBox(height: 8),
          AppText.titleText(
            title: title ?? "",
            fontSize: 14,
            maxLine: 2,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
            color: AppColorSets.textGreyColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AppText.subTitleText(
                    subTitle: "\$$price" ?? "",
                    color: AppColorSets.textBlackColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColorSets.backgroundDarkOrangeColor,
                ),
                child: AppText.subTitleText(
                  subTitle: "x $qty" ?? "",
                  color: AppColorSets.textWhiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
