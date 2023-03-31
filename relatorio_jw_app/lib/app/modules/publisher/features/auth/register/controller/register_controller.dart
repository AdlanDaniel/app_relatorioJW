import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class RegisterController extends GetxController {
  AuthService authService;
  RegisterController({
    required this.authService,
  });
  TextEditingController nameEC = TextEditingController();
  TextEditingController emailEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  TextEditingController confirmPasswordEC = TextEditingController();

  RxBool isVisible = true.obs;

  RxString messagePassword = ''.obs;
  @override
  void onClose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.onClose();
  }

  UserPublisher getUser() {
    UserPublisher userPublisher = UserPublisher();
    userPublisher.name = nameEC.text;
    userPublisher.email = emailEC.text;
    userPublisher.password = passwordEC.text;
    return userPublisher;
  }

  void cleanFields() {
    nameEC.clear();
    emailEC.clear();
    passwordEC.clear();
    confirmPasswordEC.clear();
  }

  void showPassword() {
    isVisible.value = !isVisible.value;
  }

  void confirmPass() {
    if (passwordEC.text != confirmPasswordEC.text) {
      messagePassword.value = 'Senhas não conferem';
    }
  }

  Rx<Status> status = Status.initial.obs;
  void setStatus(Status status) {
    this.status.value = status;
  }

  Future<void> registerPublisher(BuildContext context) async {
    setStatus(Status.loading);
    try {
      await authService.registerPublisher(getUser());
      cleanFields();
      setStatus(Status.success);
    } on AuthServiceError catch (err) {
      if (err is AuthServiceNetworkError) {
        Navigator.pushNamed(context, AppRoutes.errorNetworkPage);
        setStatus(Status.initial);
      } else {
        Navigator.pushNamed(context, AppRoutes.errorGenericPage);
        setStatus(Status.initial);
      }
    }
  }
}
