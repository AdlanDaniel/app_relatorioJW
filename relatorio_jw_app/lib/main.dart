import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relatorio_jw_app/app/binding/initial_binding.dart';
import 'package:relatorio_jw_app/app/core/application_config_start.dart';
import 'package:relatorio_jw_app/app/core/navigator/app_navigator.dart';

import 'package:relatorio_jw_app/app/routes/app_routes.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await ApplicationConfigStart().configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      navigatorKey: AppNavigator.global,
      title: 'Relatorio Jw',
      theme: RelatorioJwTheme.lightTheme,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: AppRoutes.splashScreenPage,
      initialBinding: InitialBinding(),
    );
  }
}
