import 'package:relatorio_jw_app/app/core/http_client/rest_client.dart';
import 'package:relatorio_jw_app/app/core/injection/injection.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/controller/home_controller.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/repository/home_repository.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/service/home_service.dart';

class HomeDI {
  static void configDependencies() {
    _homeRepository();
    _homeService();
    _homeController();
  }
}

void _homeRepository() {
  Injection.lazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(restClient: Injection.get<RestClient>()));
}

void _homeService() {
  Injection.lazySingleton<HomeService>(
      () => HomeService(homeRepository: Injection.get<HomeRepository>()));
}

void _homeController() {
  Injection.lazySingleton<HomeController>(
      () => HomeController(homeService: Injection.get<HomeService>()));
}
