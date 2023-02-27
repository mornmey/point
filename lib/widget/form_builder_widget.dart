import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/widget/app_button_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';
import 'package:horpao_point/widget/app_form_build_date_picker.dart';
import 'package:horpao_point/widget/app_form_build_drop_down.dart';
import 'package:horpao_point/widget/app_form_build_text_form_field.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class FormBuilderWidget extends ConsumerStatefulWidget {
  final String? title;
  final String? name;
  final String? nameKH;
  final VoidCallback? onPressed;
  final GlobalKey<FormBuilderState>? formKey;
  final String? buttonText;
  final Map<String, dynamic>? initialValue;
  const FormBuilderWidget({
    Key? key,
    this.title,
    this.name,
    this.nameKH,
    this.onPressed,
    this.formKey,
    this.buttonText,
    this.initialValue,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FormBuilderWidgetState();
}

class _FormBuilderWidgetState extends ConsumerState<FormBuilderWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppPlainPageWithSingleScrollWidget(
      title: widget.title,
      bodyChild: Column(
        children: [
          Column(
            children: [
              Visibility(
                visible: widget.name == null,
                replacement: const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColorSets.colorPrimaryBlue,
                  backgroundImage: AssetImage("lib/assets/images/profile.png"),
                ),
                child: const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: AppColorSets.colorPrimaryBlue,
                ),
              ),
              const SizedBox(height: 10),
              AppText.titleText(
                fontSize: 16,
                color: AppColorSets.backgroundBlackColor,
                title: widget.nameKH ?? LocaleKeys.hor_pao_point.tr(),
              ),
              const SizedBox(height: 10),
              AppText.subTitleText(
                subTitle: widget.name ?? LocaleKeys.basic_register.tr(),
              ),
              const SizedBox(height: 26),
            ],
          ),
          AppCard(
            elevation: 2,
            radius: 10,
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: FormBuilder(
              key: widget.formKey,
              initialValue: widget.initialValue ?? {},
              child: Column(
                children: [
                  AppFormBuilderTextFormField(
                    name: "name_kh",
                    // maxLength: 20,
                    hintText: LocaleKeys.enter_your_name_km.tr(),
                    validators: FormBuilderValidators.required(),
                  ),
                  AppFormBuilderTextFormField(
                    name: "name",
                    // maxLength: 20,
                    hintText: LocaleKeys.enter_your_name_en.tr(),
                    validators: FormBuilderValidators.required(),
                  ),
                  AppFormBuilderTextFormField(
                    name: "primary_phone",
                    // maxLength: 20,
                    keyboardType: TextInputType.phone,
                    hintText: LocaleKeys.enter_your_phone_number.tr(),
                    validators: FormBuilderValidators.required(),
                  ),
                  AppFormBuilderTextFormField(
                    name: "second_phone",
                    // maxLength: 20,
                    keyboardType: TextInputType.phone,
                    hintText: LocaleKeys.enter_your_phone_number.tr(),
                    validators: FormBuilderValidators.required(),
                  ),
                  AppFormBuilderTextFormField(
                    name: "password",
                    // maxLength: 20,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.number,
                    hintText: LocaleKeys.enter_your_password.tr(),
                    validators: FormBuilderValidators.required(),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 15,
                        color: AppColorSets.backgroundBlueColor,
                      ),
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  AppFormBuildDatePicker(
                    name: 'date_of_birth',
                    // maxLength: 20,
                    dateFormat: DateFormat('dd MMM yyyy'),
                    hintText: LocaleKeys.enter_your_dob.tr(),
                    validators: FormBuilderValidators.required(),
                  ),
                  AppFormBuilderDropDown(
                    name: "sex",
                    hintText: LocaleKeys.enter_your_gender.tr(),
                    validators: FormBuilderValidators.required(),
                    items: ["Male", "Female", "Other"].map((sex) {
                      return DropdownMenuItem(value: sex, child: Text(sex));
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      belowWidget: AppButton(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 26),
        buttonTxt: widget.buttonText ?? LocaleKeys.submit.tr().toUpperCase(),
        onPressed: widget.onPressed,
      ),
    );
  }
}
