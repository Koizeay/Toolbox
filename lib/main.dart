// To update translations edit json in assets/translations then run:
// flutter pub run slang

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/hierarchy.dart';
import 'package:toolbox/pages/main_shell_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    MobileAds.instance.initialize();
  }

  WakelockPlus.enable();
  LocaleSettings.useDeviceLocale();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    TranslationProvider(
      child: MyApp(
        isFolderView: prefs.getBool(SHARED_PREFERENCES_CORE_HOMEPAGE_ISFOLDERVIEW) ?? false,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFolderView;

  const MyApp({super.key, required this.isFolderView});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // Fallback colors if device has no dynamic color support (iOS, older Android)
        const fallbackSeed = Colors.deepOrange;

        final lightColorScheme = lightDynamic ??
            ColorScheme.fromSeed(seedColor: fallbackSeed, brightness: Brightness.light);

        final darkColorScheme = darkDynamic ??
            ColorScheme.fromSeed(seedColor: fallbackSeed, brightness: Brightness.dark);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: t.generic.app_name,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            appBarTheme: AppBarTheme(
              backgroundColor: lightColorScheme.surface,
              foregroundColor: lightColorScheme.onSurface,
              systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            appBarTheme: AppBarTheme(
              backgroundColor: darkColorScheme.surface,
              foregroundColor: darkColorScheme.onSurface,
              systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              ),
            ),
          ),
          builder: (_, child) {
            return child ?? const SizedBox();
          },
          home: MainShellPage(toolsContent: isFolderView
              ? Hierarchy.hierarchy
              : Hierarchy.getFlatHierarchy()),
        );
      },
    );
  }
}
