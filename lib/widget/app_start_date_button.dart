import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';

class AppStartDateButton extends StatefulWidget {
  const AppStartDateButton({super.key});

  @override
  State<AppStartDateButton> createState() => _AppStartDateButtonState();
}

class _AppStartDateButtonState extends State<AppStartDateButton> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime(2030),
          locale: context.locale,
          errorFormatText: LocaleKeys.enter_valid_date.tr(),
          fieldLabelText: LocaleKeys.start_date.tr().toUpperCase(),
          helpText: LocaleKeys.select_date.tr().toUpperCase(),
          cancelText: LocaleKeys.cancel.tr().toUpperCase(),
          confirmText: LocaleKeys.ok.tr().toUpperCase(),
          builder: (context, child) {
            return Container(
              child: child,
            );
          },
        );
        if (picked != null) {
          _dateTime = picked;
          // context.read<ItemReportData>().setStart(picked);
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.titleText(
            fontSize: 16,
            color: AppColorSets.backgroundBlackColor,
            title: LocaleKeys.start_date.tr(),
          ),
          const SizedBox(height: 5),
          AppText.subTitleText(
            subTitle: DateFormat('dd MMM yyyy').format(_dateTime).tr(),
          ),
          // Selector<ItemReportData, DateTime>(
          //   selector: (context, exp) => exp.start ?? DateTime.now(),
          //   builder: (_, date, __) {
          //     return AppText.subTitle14GreyColor(
          //       subTitle: DateFormat('yyyy-MMM-dd').format(DateTime.parse(date.toIso8601String())),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
