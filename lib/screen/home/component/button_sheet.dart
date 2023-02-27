import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/provider/provider.dart';
import 'package:horpao_point/screen/home/home_widget.dart';
import 'package:horpao_point/screen/profile/component/list_item_widget.dart';
import 'package:horpao_point/widget/app_button_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';
import 'package:horpao_point/widget/app_form_build_text_form_field.dart';

Future bottomSheet({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required GlobalKey<FormBuilderState>? formKey,
  required BuildContext context,
  required WidgetRef ref,
}) {
  final size = MediaQuery.of(context).size;
  void onChanged(dynamic val) => debugPrint(val.toString());
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    constraints: BoxConstraints(
      maxHeight: size.height - scaffoldKey.currentState!.appBarMaxHeight!,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return FormBuilder(
        key: formKey,
        child: Container(
          color: AppColorSets.backgroundWhiteColor,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 90),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ref.watch(fetchAccountByBranchId(1)).when(
                            data: (data) => Column(
                              children: List.generate(
                                data.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: AppCard(
                                    color: AppColorSets.backgroundGreyColor,
                                    padding: EdgeInsets.zero,
                                    radius: 15,
                                    inkWellRadius: 15,
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => HomeWidget(
                                            account: data[index],
                                          ),
                                        ),
                                      );
                                      // router.navigateTo(context, AppRoutes.home);
                                      print("Branch ID ${data[index].id}");
                                    },
                                    child: ListItemWidget(
                                      title: data[index].corporateName,
                                      subTitle: data[index].corporateName,
                                      trailingBackgroundColor:
                                          AppColorSets.backgroundBlueColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (error, stackTrace) => const SizedBox(),
                          ),
                    ),
                    AppButton(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 30,
                      ),
                      buttonTxt: LocaleKeys.cancel.tr().toUpperCase(),
                      onPressed: () => router.pop(context),
                    ),
                  ],
                ),
              ),
              AppCard(
                radius: 15,
                padding: const EdgeInsets.all(16),
                child: AppFormBuilderTextFormField(
                  name: "shop_name",
                  inputBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColorSets.backgroundBlueColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    child: const Icon(
                      Icons.clear,
                      size: 20,
                      color: AppColorSets.backgroundBlueColor,
                    ),
                    onTap: () {
                      formKey!.currentState!.reset();
                    },
                  ),
                  onChange: onChanged,
                  hintText: LocaleKeys.shop_or_branch.tr(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
