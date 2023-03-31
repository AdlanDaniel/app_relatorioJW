import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:relatorio_jw_app/app/modules/publisher/features/auth/login/controller/login_controller.dart';

import 'package:relatorio_jw_app/app/modules/publisher/features/auth/resources/auth_publisher_message.dart';

import 'package:relatorio_jw_app/app/routes/app_routes.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';
import 'package:validatorless/validatorless.dart';

const _sizeTopImage = 78.8;
const _sizeTop = 18.0;
const _sizeTopX = 40.0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status.value == Status.loading) {
        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          ),
        ));
      }
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
            elevation: 0,
            backgroundColor: CustomColors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: CustomColors.blueLight,
              ),
            ),
          ),
          body: Form(
            key: keyForm,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                    top: _sizeTopImage,
                    left: DesignTokens.sizeXL,
                    right: DesignTokens.sizeXL),
                child: Column(
                  children: [
                    Image.asset('assets/imagem/imagemPagInitial.png'),
                    const SizedBox(height: DesignTokens.sizeXL),
                    const Text(
                      AuthPublisherMessage.infoLogin,
                      style: TextStyle(
                          color: CustomColors.greyDark,
                          fontWeight: FontWeight.w400,
                          fontSize: DesignTokens.sizeM),
                    ),
                    const SizedBox(height: DesignTokens.sizeXXL),
                    CustomTextFormField(
                      labelText: AuthPublisherMessage.email,
                      controller: controller.emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            AuthPublisherMessage.validatorMessage),
                        Validatorless.email(AuthPublisherMessage.validadorEmail)
                      ]),
                    ),
                    const SizedBox(height: _sizeTop),
                    CustomTextFormField(
                        labelText: AuthPublisherMessage.password,
                        controller: controller.passwordEC,
                        obscureText: controller.isVisible.value,
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.showPassword();
                            },
                            icon: controller.isVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        validator: Validatorless.required(
                            AuthPublisherMessage.validatorMessage)),
                    const SizedBox(height: DesignTokens.sizeXXL),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: _sizeTopX,
                      child: CustomButton(
                        type: ButtonType.contained,
                        text: AuthPublisherMessage.enter,
                        onPressed: () async {
                          if (keyForm.currentState!.validate()) {
                            await controller.signIn(context);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: _sizeTopX),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: AuthPublisherMessage.haveRegister,
                          style: TextStyle(
                            color: Color.fromARGB(255, 67, 50, 50),
                            fontWeight: FontWeight.w400,
                            fontSize: DesignTokens.sizeL,
                          ),
                        ),
                        TextSpan(
                          text: AuthPublisherMessage.clickHere,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, AppRoutes.registerPublisher);
                            },
                          style: const TextStyle(
                              color: CustomColors.blueLight,
                              fontWeight: FontWeight.w400,
                              fontSize: DesignTokens.sizeL,
                              decoration: TextDecoration.underline),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
    // return Scaffold(
    //     floatingActionButton: IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.help,
    //           size: DesignTokens.sizeXXL,
    //           color: CustomColors.blueLight,
    //         )),
    //     backgroundColor: CustomColors.white,
    //     appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: CustomColors.white,
    //       leading: IconButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         icon: const Icon(
    //           Icons.arrow_back_ios,
    //           color: CustomColors.blueLight,
    //         ),
    //       ),
    //     ),
    //     body: Obx(() {
    //       if (controller.status.value == Status.loading) {
    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: const [CircularProgressIndicator()],
    //           ),
    //         );
    //       }
    //       return Form(
    //         key: keyForm,
    //         child: SingleChildScrollView(
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //                 top: _sizeTopImage,
    //                 left: DesignTokens.sizeXL,
    //                 right: DesignTokens.sizeXL),
    //             child: Column(
    //               children: [
    //                 Image.asset('assets/imagem/imagemPagInitial.png'),
    //                 const SizedBox(height: DesignTokens.sizeXL),
    //                 const Text(
    //                   AuthPublisherMessage.infoLogin,
    //                   style: TextStyle(
    //                       color: CustomColors.greyDark,
    //                       fontWeight: FontWeight.w400,
    //                       fontSize: DesignTokens.sizeSM),
    //                 ),
    //                 const SizedBox(height: DesignTokens.sizeXXL),
    //                 CustomTextFormField(
    //                   labelText: AuthPublisherMessage.login,
    //                   controller: controller.emailEC,
    //                   validator: Validatorless.multiple([
    //                     Validatorless.required(
    //                         AuthPublisherMessage.validatorMessage),
    //                     Validatorless.email(AuthPublisherMessage.validadorEmail)
    //                   ]),
    //                 ),
    //                 const SizedBox(height: _sizeTop),
    //                 CustomTextFormField(
    //                     labelText: AuthPublisherMessage.password,
    //                     controller: controller.passwordEC,
    //                     obscureText: controller.isVisible.value,
    //                     suffixIcon: IconButton(
    //                         onPressed: () {
    //                           controller.showPassword();
    //                         },
    //                         icon: controller.isVisible.value
    //                             ? const Icon(Icons.visibility_off)
    //                             : const Icon(Icons.visibility)),
    //                     validator: Validatorless.required(
    //                         AuthPublisherMessage.validatorMessage)),
    //                 const SizedBox(height: DesignTokens.sizeXXL),
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width,
    //                   height: _sizeTopX,
    //                   child: CustomButton(
    //                     type: ButtonType.contained,
    //                     text: AuthPublisherMessage.enter,
    //                     onPressed: () async {
    //                       if (keyForm.currentState!.validate()) {
    //                         await controller.signIn(context);
    //                       }
    //                     },
    //                   ),
    //                 ),
    //                 const SizedBox(height: _sizeTopX),
    //                 RichText(
    //                   text: TextSpan(children: [
    //                     const TextSpan(
    //                       text: AuthPublisherMessage.haveRegister,
    //                       style: TextStyle(
    //                         color: Color.fromARGB(255, 67, 50, 50),
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: DesignTokens.sizeL,
    //                       ),
    //                     ),
    //                     TextSpan(
    //                       text: AuthPublisherMessage.clickHere,
    //                       recognizer: TapGestureRecognizer()
    //                         ..onTap = () {
    //                           Navigator.pushNamed(
    //                               context, AppRoutes.registerPublisher);
    //                         },
    //                       style: const TextStyle(
    //                           color: CustomColors.blueLight,
    //                           fontWeight: FontWeight.w400,
    //                           fontSize: DesignTokens.sizeL,
    //                           decoration: TextDecoration.underline),
    //                     )
    //                   ]),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     }));
  }
}
