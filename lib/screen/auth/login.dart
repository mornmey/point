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
import 'package:horpao_point/widget/app_form_build_text_form_field.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';

class LoginWidget extends ConsumerStatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _FormBuilderWidgetState();
}

class _FormBuilderWidgetState extends ConsumerState<LoginWidget> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AppPlainPageWithSingleScrollWidget(
      allowedBack: false,
      title: LocaleKeys.login.tr().toUpperCase(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      bodyChild: Column(
        children: [
          Column(
            children: [
              AppText.titleText(
                fontSize: 16,
                color: AppColorSets.backgroundBlackColor,
                title: LocaleKeys.welcome_to.tr(),
              ),
              const SizedBox(height: 10),
              AppText.titleText(
                fontSize: 24,
                color: AppColorSets.backgroundBlackColor,
                title: LocaleKeys.hor_pao_point.tr(),
              ),
              const SizedBox(height: 50),
            ],
          ),
          AppCard(
            elevation: 2,
            radius: 10,
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  AppFormBuilderTextFormField(
                    name: "primary_phone",
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
                ],
              ),
            ),
          ),
          AppButton(
            margin: const EdgeInsets.symmetric(vertical: 26),
            buttonTxt: LocaleKeys.submit.tr(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
