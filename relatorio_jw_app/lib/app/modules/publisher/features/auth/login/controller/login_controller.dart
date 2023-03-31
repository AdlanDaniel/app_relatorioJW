import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relatorio_jw_app/app/core/custom_error_page.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/service/service_publisher.dart';
import 'package:relatorio_jw_app/app/routes/app_routes.dart';

enum Status {
  initial,
  networkError,
  clientError,
  serverError,
  genericError,
  loading,
  success
}

class LoginController extends GetxController {
  AuthService authService;
  LoginController({
    required this.authService,
  });
  TextEditingController emailEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  Rx<Status> status = Status.initial.obs;

  RxBool isVisible = true.obs;
  void showPassword() {
    isVisible.value = !isVisible.value;
  }

  void changeStatus(Status status) {
    this.status.value = status;
  }

  @override
  void onClose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.onClose();
  }

  UserPublisher getUserPublisher() {
    UserPublisher userPublisher = UserPublisher();
    userPublisher.email = emailEC.text;
    userPublisher.password = passwordEC.text;
    return userPublisher;
  }

  void clearfield() {
    emailEC.clear();
    passwordEC.clear();
  }

  Future signIn(BuildContext context) async {
    changeStatus(Status.loading);
    try {
      await authService.signIn(getUserPublisher());

      changeStatus(Status.success);
      clearfield();

      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.homePage, (route) => false);
    } on AuthServiceError catch (error) {
      if (error is AuthServiceNetworkError) {
        clearfield();
        Navigator.pushNamed(context, AppRoutes.errorNetworkPage);
        changeStatus(Status.initial);
      } else {
        clearfield();
        Navigator.pushNamed(context, AppRoutes.errorGenericPage);
        changeStatus(Status.initial);
      }
    }
  }
}
