import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/screen/point/component/history_item_widget.dart';
import 'package:horpao_point/screen/point/component/reward_item_widget.dart';
import 'package:horpao_point/widget/app_credit_card_widget.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class CardPointWidget extends StatefulWidget {
  const CardPointWidget({Key? key}) : super(key: key);

  @override
  State<CardPointWidget> createState() => _CardPointWidgetState();
}

class _CardPointWidgetState extends State<CardPointWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _reward = true;
  @override
  Widget build(BuildContext context) {
    return AppPlainPageWidget(
      title: LocaleKeys.card_point.tr().toUpperCase(),
      scaffoldKey: scaffoldKey,
      bodyChild: Column(
        children: [
          const SizedBox(height: 16),
          Hero(
            tag: "point",
            transitionOnUserGestures: true,
            child: AppCreditCardWidget(
              title: LocaleKeys.point.tr(),
              point: 100,
              shopName: "Hor Pao MM",
              branchName: "Hor Pao",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_reward == true) {
                        true;
                      } else {
                        _reward = !_reward;
                      }
                    });
                  },
                  child: AppText.titleText(
                    title: LocaleKeys.reward.tr(),
                    color: AppColorSets.colorPrimaryBlue.withOpacity(
                      _reward ? 1 : 0.5,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_reward == false) {
                        false;
                      } else {
                        _reward = !_reward;
                      }
                    });
                  },
                  child: AppText.titleText(
                    title: LocaleKeys.history.tr(),
                    color: AppColorSets.colorPrimaryBlue.withOpacity(
                      _reward ? 0.5 : 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Visibility(
              visible: _reward,
              replacement: const HistoryItemWidget(),
              child: RewardItemWidget(
                scaffoldKey: scaffoldKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
