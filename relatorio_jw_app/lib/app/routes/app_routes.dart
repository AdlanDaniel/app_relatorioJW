import 'dart:io';

import 'package:flutter/material.dart';
import 'package:relatorio_jw_app/app/core/custom_error_page.dart';
import 'package:relatorio_jw_app/app/modules/initial/page/initial_page.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/login/page/login_page.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/register/page/pos_registter_page_teste.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/register/page/register_page.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/page/home_page.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/pdf/page/pdf_page.dart';
import 'package:relatorio_jw_app/app/modules/splash_screen/page/splash_screen_page.dart';

class AppRoutes {
  AppRoutes._();

  static const splashScreenPage = '/';
  static const initialPage = '/initialPage';
  static const registerPublisher = '/registerPublisher';
  static const loginPublisher = '/loginPublisher';
  static const errorNetworkPage = '/errorNetworkPage';
  static const errorGenericPage = '/errorGenericPage';
  static const posRegisterPageTeste = '/posRegisterTestePage';
  static const homePage = '/homePage';
  static const pdfPage = '/pdfPage';

  static const error = '/unknow';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splashScreenPage:
        return MaterialPageRoute(
            builder: (context) => const SplashScreenPage());

      case AppRoutes.initialPage:
        return MaterialPageRoute(builder: (context) => const InitialPage());

      case AppRoutes.loginPublisher:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case AppRoutes.registerPublisher:
        return MaterialPageRoute(builder: (context) => const RegisterPage());

      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case AppRoutes.pdfPage:
        args as File;
        return MaterialPageRoute(builder: (context) => PdfPage(file: args));

      case AppRoutes.errorNetworkPage:
        return MaterialPageRoute(
            builder: (context) => const CustomErrorPage(
                  isNetworkError: true,
                ));

      case AppRoutes.errorGenericPage:
        return MaterialPageRoute(builder: (context) => const CustomErrorPage());
      case AppRoutes.posRegisterPageTeste:
        return MaterialPageRoute(
            builder: (context) => const PosRegistterPageTeste());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Rota não encontrada'),
        ),
      );
    });
  }
}
