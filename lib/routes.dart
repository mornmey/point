import 'package:fluro/fluro.dart';
import 'package:horpao_point/screen/auth/login.dart';
import 'package:horpao_point/screen/auth/register_widget.dart';
import 'package:horpao_point/screen/home/home_widget.dart';
import 'package:horpao_point/screen/home/splash_screen_widget.dart';
import 'package:horpao_point/screen/item/item_package_widget.dart';
import 'package:horpao_point/screen/notification/notification_widget.dart';
import 'package:horpao_point/screen/point/card_point_widget.dart';
import 'package:horpao_point/screen/profile/edit_profile/edit_profile_widget.dart';
import 'package:horpao_point/screen/profile/langauge/language_widget.dart';
import 'package:horpao_point/screen/profile/profile_widget.dart';
import 'package:horpao_point/screen/qr_code/qr_code_scanner_widget.dart';
import 'package:horpao_point/screen/transaction/transaction_widget.dart';
import 'package:horpao_point/screen/transaction/transaction_history_widget.dart';
import 'package:horpao_point/screen/voucher/card_voucher_widget.dart';

class AppRoutes {
  /// SplashScreen
  static const String splashScreen = "/";

  /// Auth
  static const String register = "/register_widget";
  static const String login = "/login_widget";

  /// Home
  static const String home = "/home_widget";

  /// Transaction
  static const String transaction_history = "/transaction_widget";

  /// Qr code
  static const String qr_code = "/qr_code_widget";
  static const String transaction = "/transfer_widget";

  /// Profile
  static const String profile = "/profile_widget";
  static const String edit_profile = "/edit_profile_widget";
  static const String changeLang = "/change_lang_widget";

  /// Notification
  static const String notification = "/notification_widget";

  /// Point
  static const String point = "card_point_widget";

  /// Item
  static const String item = "item_package_widget";

  /// Voucher
  static const String voucher = "card_voucher_widget";
}

FluroRouter config() {
  final router = FluroRouter();

  /// Splash Screen
  router.define(
    AppRoutes.splashScreen,
    handler: Handler(
      handlerFunc: (context, paras) => const SplashScreenWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Auth
  router.define(
    AppRoutes.register,
    handler: Handler(
      handlerFunc: (context, paras) => RegisterWidget(),
    ),
    transitionType: TransitionType.native,
  );

  router.define(
    AppRoutes.login,
    handler: Handler(
      handlerFunc: (context, paras) => const LoginWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Home
  router.define(
    AppRoutes.home,
    handler: Handler(
      handlerFunc: (context, paras) => const HomeWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Transaction
  router.define(
    AppRoutes.transaction_history,
    handler: Handler(
      handlerFunc: (context, paras) => const TransactionHistoryWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Qr Code
  router.define(
    AppRoutes.qr_code,
    handler: Handler(
      handlerFunc: (context, paras) => const QRCodeScannerWidget(),
    ),
    transitionType: TransitionType.native,
  );

  router.define(
    AppRoutes.transaction,
    handler: Handler(
      handlerFunc: (context, paras) => const TransactionWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Profile
  router.define(
    AppRoutes.profile,
    handler: Handler(
      handlerFunc: (context, paras) => const ProfileWidget(),
    ),
    transitionType: TransitionType.native,
  );

  router.define(
    AppRoutes.edit_profile,
    handler: Handler(
      handlerFunc: (context, paras) => EditProfileWidget(),
    ),
    transitionType: TransitionType.native,
  );

  router.define(
    AppRoutes.changeLang,
    handler: Handler(
      handlerFunc: (context, paras) => const LanguageWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Notification
  router.define(
    AppRoutes.notification,
    handler: Handler(
      handlerFunc: (context, paras) => const NotificationWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Point
  router.define(
    AppRoutes.point,
    handler: Handler(
      handlerFunc: (context, paras) => const CardPointWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Item
  router.define(
    AppRoutes.item,
    handler: Handler(
      handlerFunc: (context, paras) => const ItemPackageWidget(),
    ),
    transitionType: TransitionType.native,
  );

  /// Voucher
  router.define(
    AppRoutes.voucher,
    handler: Handler(
      handlerFunc: (context, paras) => const CardVoucherWidget(),
    ),
    transitionType: TransitionType.native,
  );

  return router;
}
