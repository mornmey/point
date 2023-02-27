import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/provider/provider.dart';
import 'package:horpao_point/routes.dart';
import 'package:horpao_point/widget/form_builder_widget.dart';

class RegisterWidget extends ConsumerWidget {
  RegisterWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderWidget(
      title: LocaleKeys.register.tr().toUpperCase(),
      formKey: _formKey,
      onPressed: () {
        final userStateNotifier = ref.watch(userProvider.notifier);
        if (_formKey.currentState!.saveAndValidate()) {
          final newUser = User.fromJson(_formKey.currentState!.value);
          userStateNotifier.createUser(newUser);
          router.navigateTo(
            context,
            AppRoutes.home,
            replace: true,
            transition: TransitionType.cupertino,
          );
        } else {
          debugPrint(_formKey.currentState?.value.toString());
          debugPrint('validation failed');
        }
      },
    );
  }
}
