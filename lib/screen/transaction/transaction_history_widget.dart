import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/screen/transaction/component/transaction_all_widget.dart';
import 'package:horpao_point/widget/app_end_date_button.dart';
import 'package:horpao_point/screen/transaction/component/transaction_expense_widget.dart';
import 'package:horpao_point/screen/transaction/component/transaction_income_widget.dart';
import 'package:horpao_point/widget/app_start_date_button.dart';
import 'package:horpao_point/widget/app_tap_bar_widget.dart';

class TransactionHistoryWidget extends StatelessWidget {
  const TransactionHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLangSelected = LanguageCode.KH_CODE == context.locale.languageCode;
    return AppTabBarWidget(
      length: 3,
      title: LocaleKeys.transaction_history.tr().toUpperCase(),
      tabs: [
        Tab(text: LocaleKeys.all.tr()),
        Tab(text: LocaleKeys.income.tr()),
        Tab(text: LocaleKeys.expense.tr()),
      ],
      childrenDate: const [
        AppStartDateButton(),
        AppEndDateButton(),
      ],
      childrenItem: const [
        /// All Transaction
        TransactionAllWidget(),

        /// Income Transaction
        TransactionIncomeWidget(),

        /// Expense Transaction
        TransactionExpenseWidget(),
      ],
    );
  }
}
