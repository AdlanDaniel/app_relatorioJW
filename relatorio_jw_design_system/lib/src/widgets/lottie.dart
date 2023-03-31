import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system_module.dart';

class Lottie extends StatelessWidget {
  const Lottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: LottieBuilder.asset(
        'assets/animations/loading.json',
        package: AppMixDesignSystemModule.packageName,
      ),
    );
  }
}
