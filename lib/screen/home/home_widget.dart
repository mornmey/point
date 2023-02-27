import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/localization/locale_key.g.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/provider/provider.dart';
import 'package:horpao_point/routes.dart';
import 'package:horpao_point/screen/home/component/button_sheet.dart';
import 'package:horpao_point/screen/home/component/card_point_widget.dart';
import 'package:horpao_point/screen/home/component/card_item_widget.dart';
import 'package:horpao_point/screen/home/component/slide_show.dart';
import 'package:horpao_point/state/accounts/model/account_model.dart';
import 'package:horpao_point/widget/app_credit_card_widget.dart';
import 'package:horpao_point/widget/app_card_widget.dart';
import 'package:horpao_point/widget/app_plain_page_widget.dart';
import 'package:horpao_point/widget/app_progress_hud_widget.dart';
import 'package:horpao_point/widget/profile_display_widget.dart';

class HomeWidget extends ConsumerStatefulWidget {
  final AccountModel? account;

  const HomeWidget({
    Key? key,
    this.account,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppProgressHUD(
      inAsyncCall: ref.watch(fetchAccountByBranchId(1)).isLoading,
      child: AppPlainPageWithSingleScrollWidget(
        allowedBack: false,
        centerTitle: false,
        flex: 6,
        padding: EdgeInsets.zero,
        scaffoldKey: scaffoldKey,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColorSets.backgroundGreyColor,
            child: IconButton(
              onPressed: () {
                bottomSheet(
                  scaffoldKey: scaffoldKey,
                  formKey: formKey,
                  context: context,
                  ref: ref,
                );
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
                color: AppColorSets.backgroundBlueColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColorSets.backgroundGreyColor,
            child: IconButton(
              onPressed: () {
                router.navigateTo(context, AppRoutes.notification);
              },
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
                color: AppColorSets.backgroundBlueColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
        titleChild: ProfileDisplayWidget(
          onTap: () {
            router.navigateTo(context, AppRoutes.profile);
          },
          title: "${LocaleKeys.hello.tr()} Mey",
          subtitle: LocaleKeys.welcome.tr(),
        ),
        bodyChild: Column(
          children: [
            Wrap(
              spacing: size.width * 0.04,
              runSpacing: size.height * 0.02,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                ref.watch(fetchAccountByBranchId(1)).when(
                      data: (data) {
                        return AppCreditCardWidget(
                          width: size.width * 0.91,
                          title: LocaleKeys.balance.tr(),
                          balance:
                              widget.account?.balance ?? data.first.balance,
                          shopName: widget.account?.corporateName ??
                              data.first.corporateName,
                          branchName: widget.account?.corporateName ??
                              data.first.corporateName,
                          onTap: () {
                            router.navigateTo(
                              context,
                              AppRoutes.transaction_history,
                            );
                          },
                        );
                      },
                      loading: () => const Center(),
                      error: (error, stackTrace) => const SizedBox(),
                    ),
                Hero(
                  tag: "point",
                  transitionOnUserGestures: true,
                  child: AppCard(
                    width: size.width * 0.435,
                    height: size.height * 0.22,
                    onTap: () {
                      router.navigateTo(context, AppRoutes.point);
                    },
                    color: AppColorSets.backgroundLightBlueColor,
                    child: CardPointWidget(
                      title: LocaleKeys.point.tr(),
                      img: "lib/assets/images/point.png",
                    ),
                  ),
                ),
                Column(
                  children: [
                    AppCard(
                      width: size.width * 0.435,
                      height: size.height * 0.1,
                      onTap: () {
                        router.navigateTo(context, AppRoutes.item);
                      },
                      padding: EdgeInsets.zero,
                      color: AppColorSets.backgroundOrangeColor,
                      child: CardItemWidget(
                        title: LocaleKeys.item.tr(),
                        img: "lib/assets/images/item.png",
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    AppCard(
                      width: size.width * 0.435,
                      height: size.height * 0.1,
                      onTap: () {
                        router.navigateTo(context, AppRoutes.voucher);
                      },
                      padding: EdgeInsets.zero,
                      color: AppColorSets.backgroundGreenColor,
                      child: CardItemWidget(
                        title: LocaleKeys.voucher.tr(),
                        img: "lib/assets/images/voucher.png",
                      ),
                    ),
                  ],
                ),
                AppCard(
                  width: size.width * 0.91,
                  height: size.height * 0.21,
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: SlideShow(),
                  ),
                ),
              ],
            ),
          ],
        ),
        belowWidget: Expanded(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: size.width,
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColorSets.backgroundBlueColor,
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColorSets.backgroundBlueColor,
                child: GestureDetector(
                  onTap: () {
                    router.navigateTo(context, AppRoutes.qr_code);
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColorSets.backgroundPinkColor,
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: AppColorSets.backgroundBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
