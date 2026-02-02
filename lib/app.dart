import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saas/app/screens/base_page/base_page_view.dart';
import 'package:saas/app/screens/authentication/login/login.dart';
import 'package:saas/shared/themes/app_theme.dart';
import 'core/di/get_injector.dart';
import 'core/locale/localization_services.dart';
import 'routes/app_pages.dart';

class Saas extends StatelessWidget {
  final String title;

  const Saas({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    appLog.info("app starts");
    //Logs.stringLogger("app starts");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      unknownRoute: AppPages.unknownPage,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      routes: {'/': (context) => BasePageView()},
      //themeMode: themeServices.getThemeMode(),
      locale: LocalizationServices.locale,
      fallbackLocale: const Locale("en", "US"),
      translations: LocalizationServices(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
