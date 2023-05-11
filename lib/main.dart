// To update translations edit json in assets/translations then run:
// flutter pub run slang


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/pages/home_page.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yaru/yaru.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  LocaleSettings.useDeviceLocale();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(TranslationProvider(child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return YaruTheme(
        builder: (context, yaru, child) {
          return MaterialApp(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            theme: yaru.theme,
            darkTheme: yaru.theme,
            debugShowCheckedModeBanner: false,
            title: t.generic.app_name,
            home: const HomePage(),
          );
        }
    );
  }
}