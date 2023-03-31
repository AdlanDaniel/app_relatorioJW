import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:relatorio_jw_app/app/core/http_client/dio_rest_client.dart';
import 'package:relatorio_jw_app/app/core/http_client/rest_client.dart';
import 'package:relatorio_jw_app/app/core/injection/injection.dart';
import 'package:relatorio_jw_app/app/core/local_storage/local_storage.dart';
import 'package:relatorio_jw_app/app/core/local_storage/local_storage_repository.dart';
import 'package:relatorio_jw_app/app/core/navigator/app_navigator.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/auth_di.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/home_di.dart';
import 'package:relatorio_jw_app/app/modules/splash_screen/splash_screen_DI.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment/environment.dart';

class ApplicationConfigStart {
  Future<void> configureApp() async {
    await _loadEnvs();

    await _initLocalStorage();

    _initHttp();

    AuthDI.configDependencies();

    HomeDI.configDependencies();

    SplashScreenDI.configDependencies();
  }

  Future<void> _loadEnvs() async {
    await dotenv.load();
    Injection.lazySingleton<Environment>(() => DefaultEnvironment(dotenv),
        fenix: true);
  }

  Future<void> _initLocalStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final preferencesStorage = SharedPreferencesStorage(sharedPreferences);

    Injection.lazySingleton<PreferencesStorage>(() => preferencesStorage,
        fenix: true);

    Injection.lazySingleton<LocalStorageRepository>(
        () => LocalStorageRepositoryImpl(Get.find<PreferencesStorage>()),
        fenix: true);
  }

  void _initHttp() {
    Injection.registerSingleton<RestClient>(
        DioRestClient(localStorage: Get.find<LocalStorageRepository>()),
        permanent: true);

    Injection.lazySingleton<AppNavigator>(() => AppNavigator(
        navigator: AppNavigator.global,
        navigatorObserver: NavigatorObserver()));
  }
}
