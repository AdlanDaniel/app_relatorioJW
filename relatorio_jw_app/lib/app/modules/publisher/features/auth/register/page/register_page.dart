import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:relatorio_jw_app/app/modules/publisher/features/auth/register/controller/register_controller.dart';

import 'package:relatorio_jw_app/app/modules/publisher/features/auth/resources/auth_publisher_message.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/resources/auth_publisher_validator.dart';

import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';
import 'package:validatorless/validatorless.dart';

const _topHeight = 78.8;
const _leftHeight = 21.0;
const _rigthHeight = 27.0;
const _sizeHeight = 40.0;
const padImageLeft = 84.0;
const padImageRigth = 78.0;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.find<RegisterController>();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              size: DesignTokens.sizeXXL,
              color: CustomColors.blueLight,
            )),
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: CustomColors.blueLight,
          ),
          foregroundColor: CustomColors.greyMedium,
          elevation: 0,
          backgroundColor: CustomColors.white,
        ),
        body: Obx(() {
          if (controller.status.value == Status.loading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          }

          return Container(
            padding: const EdgeInsets.only(
                left: _leftHeight, right: _rigthHeight, top: _topHeight),
            child: Form(
              key: keyForm,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/imagem/imagemPagInitial.png'),
                    const SizedBox(height: DesignTokens.sizeXXL),
                    CustomTextFormField(
                      labelText: AuthPublisherMessage.name,
                      controller: controller.nameEC,
                      validator: Validatorless.required('Campo Obrigátorio'),
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                        labelText: AuthPublisherMessage.email,
                        validator: Validatorless.multiple([
                          Validatorless.required(
                              AuthPublisherMessage.validatorMessage),
                          Validatorless.email(
                              AuthPublisherMessage.validadorEmail)
                        ]),
                        controller: controller.emailEC),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: AuthPublisherMessage.password,
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            AuthPublisherMessage.validatorMessage),
                      ]),
                      controller: controller.passwordEC,
                      obscureText: controller.isVisible.value,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.showPassword();
                          },
                          icon: controller.isVisible.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    Row(
                      children: [
                        Text(
                          controller.messagePassword.value,
                          style: const TextStyle(color: CustomColors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: AuthPublisherMessage.confirmPassword,
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            AuthPublisherMessage.validatorMessage),
                        AuthPublisherValidator.comparePassword(
                            controller.passwordEC,
                            AuthPublisherMessage.messagePassword)
                      ]),
                      controller: controller.confirmPasswordEC,
                      obscureText: controller.isVisible.value,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.showPassword();
                          },
                          icon: controller.isVisible.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    Row(
                      children: [
                        Text(
                          controller.messagePassword.value,
                          style: const TextStyle(color: CustomColors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: _sizeHeight,
                      child: CustomButton(
                          type: ButtonType.contained,
                          text: AuthPublisherMessage.enter,
                          onPressed: () async {
                            if (keyForm.currentState?.validate() ?? false) {
                              await controller.registerPublisher(context);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
