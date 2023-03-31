import 'package:relatorio_jw_app/app/core/injection/injection.dart';
import 'package:relatorio_jw_app/app/modules/splash_screen/controller/splash_screen_controller.dart';

class SplashScreenDI {
  SplashScreenDI._();
  static void configDependencies() {
    Injection.lazySingleton<SplashScreenController>(
        () => SplashScreenController());
  }
}
