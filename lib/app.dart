import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/di/injector.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/locale_controller.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

class MultiFlavorApp extends StatefulWidget {
  const MultiFlavorApp({super.key});

  @override
  State<MultiFlavorApp> createState() => _MultiFlavorAppState();
}

class _MultiFlavorAppState extends State<MultiFlavorApp> {
  final _router = buildRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sl<ThemeController>()),
        ChangeNotifierProvider.value(value: sl<LocaleController>()),
      ],
      child: Consumer2<ThemeController, LocaleController>(
        builder: (context, theme, localeCtrl, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            theme: AppTheme.light(theme.palette),
            darkTheme: AppTheme.dark(theme.palette),
            themeMode: theme.mode,
            locale: localeCtrl.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
