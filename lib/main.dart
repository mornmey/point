import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/app_theme.dart';
import 'package:horpao_point/constant.dart';
import 'package:horpao_point/localization/codegen_loader.g.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/routes.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

final router = routes.config();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: EasyLocalization(
        saveLocale: true,
        startLocale: const Locale(LanguageCode.KH_CODE),
        supportedLocales: const [Locale("km"), Locale("en")],
        path: "lib/assets/language",
        assetLoader: const CodegenLoader(),
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RestartApp(
      child: MaterialApp(
        theme: AppTheme.theme(context.locale.languageCode),
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        onGenerateRoute: router.generator,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
      ),
    );
  }
}

class RestartApp extends StatefulWidget {
  final Widget child;

  const RestartApp({super.key, required this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppState>()?.restartApp();
  }

  @override
  _RestartAppState createState() => _RestartAppState();
}

class _RestartAppState extends State<RestartApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
