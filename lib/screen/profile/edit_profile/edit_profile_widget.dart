import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/widget/form_builder_widget.dart';

class EditProfileWidget extends ConsumerWidget {
  EditProfileWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = User(
      name: "Morn Mey",
      nameKh: "ម៉ន ម៉ី",
      primaryPhone: "085341311",
      secondPhone: "069975571",
      password: "22222222",
      dateOfBirth: DateTime.now(),
      sex: "Male",
    );
    return FormBuilderWidget(
      title: LocaleKeys.edit_profile.tr().toUpperCase(),
      name: "Morn Mey",
      nameKH: "ម៉ន ម៉ី",
      formKey: _formKey,
      initialValue: user.toJson(),
      onPressed: () {},
    );
  }
}
