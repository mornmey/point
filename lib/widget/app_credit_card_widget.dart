import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/widget/app_card_widget.dart';

class AppCreditCardWidget extends StatelessWidget {
  final String? title;
  final num? balance;
  final num? point;
  final String? shopName;
  final String? shopLogo;
  final String? branchName;
  final VoidCallback? onTap;
  final double? width;

  const AppCreditCardWidget({
    Key? key,
    this.title,
    this.balance,
    this.point,
    this.shopName,
    this.shopLogo,
    this.branchName,
    this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      onTap: onTap,
      color: AppColorSets.backgroundGreyColor,
      width: width ?? size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.titleText(
                    fontSize: 18,
                    title: title,
                  ),
                  const SizedBox(height: 6),
                  AppText.titleText(
                    fontSize: 30,
                    title: balance != null ? "\$ $balance" : "$point",
                  ),
                  const SizedBox(height: 16),
                  AppText.titleText(
                    fontSize: 12,
                    title: branchName,
                  ),
                  const SizedBox(height: 6),
                  AppText.titleText(
                    fontSize: 12,
                    title: shopName,
                  ),
                ],
              ),
              AppCard(
                radius: 20,
                child: Visibility(
                  visible: shopLogo == null,
                  replacement: Image.network(
                    shopLogo ?? "",
                    width: 50,
                    height: 100,
                  ),
                  child: Image.asset(
                    "lib/assets/images/horpao.jpg",
                    width: 50,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
