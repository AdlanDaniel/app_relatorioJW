import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relatorio_jw_app/app/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  String titleApp() {
    String x = 'Relatório JW';
    return x;
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(Get.context!, AppRoutes.initialPage);
    super.onInit();
  }
}
