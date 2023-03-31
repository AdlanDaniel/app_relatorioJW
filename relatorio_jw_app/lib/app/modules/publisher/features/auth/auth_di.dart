import 'package:relatorio_jw_app/app/core/http_client/rest_client.dart';
import 'package:relatorio_jw_app/app/core/injection/injection.dart';
import 'package:relatorio_jw_app/app/core/local_storage/local_storage_repository.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/login/controller/login_controller.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/register/controller/register_controller.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/session_repository_publisher.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/service/service_publisher.dart';

class AuthDI {
  static void configDependencies() {
    _authRepository();
    _authService();
    _authController();
  }

  static void _authRepository() {
    Injection.lazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Injection.get<RestClient>()));
  }

  static void _authService() {
    Injection.lazySingleton<AuthService>(() => AuthService(
        repositoryPublisher: Injection.get<AuthRepository>(),
        localStorageRepository: Injection.get<LocalStorageRepository>()));
  }

  static void _authController() {
    Injection.lazySingleton<RegisterController>(
        () => RegisterController(authService: Injection.get<AuthService>()));
    Injection.lazySingleton<LoginController>(
        () => LoginController(authService: Injection.get<AuthService>()));
  }
}
