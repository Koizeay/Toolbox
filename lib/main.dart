// To update translations edit json in assets/translations then run:
// flutter pub run slang


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/hierarchy.dart';
import 'package:toolbox/pages/home_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yaru/yaru.dart';

Future<void> main() async {
  final SharedPreferences prefs;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  LocaleSettings.useDeviceLocale();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  prefs = await SharedPreferences.getInstance();
  runApp(TranslationProvider(child: MyApp(
      isFolderView: prefs.getBool(SHARED_PREFERENCES_CORE_HOMEPAGE_ISFOLDERVIEW)
          ?? false
  )));
}

class MyApp extends StatelessWidget {
  final bool isFolderView;
  const MyApp({super.key, required this.isFolderView});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return YaruTheme(
        builder: (context, yaru, child) {
          return MaterialApp(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            theme: yaru.theme?.copyWith(
              cardTheme: CardTheme(
                color: Colors.grey[100],
              ),
              appBarTheme: yaru.theme?.appBarTheme.copyWith(
                backgroundColor: Colors.grey[100],
              ),
            ),
            darkTheme: yaru.darkTheme?.copyWith(
              cardTheme: CardTheme(
                color: Colors.grey[900],
              ),
              appBarTheme: yaru.darkTheme?.appBarTheme.copyWith(
                backgroundColor: Colors.grey[900],
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: t.generic.app_name,
            home: HomePage(
                content: isFolderView
                    ? Hierarchy.hierarchy
                    : Hierarchy.getFlatHierarchy()
            ),
          );
        }
    );
  }
}