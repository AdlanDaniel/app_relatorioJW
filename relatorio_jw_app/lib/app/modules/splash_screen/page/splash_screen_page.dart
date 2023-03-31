import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:relatorio_jw_app/app/core/injection/injection.dart';
import 'package:relatorio_jw_app/app/modules/splash_screen/controller/splash_screen_controller.dart';
import 'package:relatorio_jw_app/app/routes/app_routes.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

const _topPadding = 257.0;
const _widthImage = 83.0;
const _heigthImage = 87.0;

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // @override
  // void initState() {
  //   SchedulerBinding.instance.addPostFrameCallback((_) async {
  //     await Future.delayed(const Duration(seconds: 4));
  //     Navigator.pushReplacementNamed(context, AppRoutes.initialAppPage);
  //   });

  //   super.initState();
  // }

  final controller = Injection.get<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: _topPadding),
        color: CustomColors.blueLight,
        child: Column(
          children: [
            SizedBox(
                width: _widthImage,
                height: _heigthImage,
                child: Image.asset('assets/imagem/imagemSplashScreen.png')),
            const SizedBox(height: DesignTokens.sizeSM),
            CustomText(
                text: controller.titleApp(),
                color: CustomColors.white,
                type: FontType.h5)
          ],
        ),
      ),
    );
  }
}
