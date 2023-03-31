import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:relatorio_jw_app/app/core/injection/injection.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/controller/home_controller.dart';

import 'package:relatorio_jw_app/app/modules/publisher/resources/messages.dart';

import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';
import 'package:validatorless/validatorless.dart';

const _heigthAppBar = 62.0;
const _heigthTitle = 20.0;
const _heigthText = 27.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    controller.getPublisher(context);
    controller.getMounth();
    super.initState();
  }

  final controller = Injection.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.statu.value == Status.loading) {
        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          ),
        ));
      }
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.signOut(context);
                },
                icon: const Icon(Icons.logout))
          ],
          toolbarHeight: _heigthAppBar,
          centerTitle: true,
          title: Column(
            children: [
              Image.asset('assets/imagem/jw.png'),
              Image.asset('assets/imagem/relatorio.png')
            ],
          ),
          backgroundColor: CustomColors.blueLight,
        ),
        body: Obx(() {
          if (controller.statu.value == Status.loading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(
                    color: CustomColors.blueLight,
                  ),
                )
              ],
            );
          }
          return Form(
            key: controller.keyForm,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  left: DesignTokens.sizeXL,
                  right: DesignTokens.sizeXL,
                ),
                color: CustomColors.white,
                child: Column(
                  children: [
                    const SizedBox(height: DesignTokens.sizeXL),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomText(
                        text: controller.dateNow(),
                        color: CustomColors.greyDark,
                        bold: true,
                        type: FontType.label,
                      ),
                    ]),
                    const SizedBox(height: _heigthTitle),
                    Row(children: [
                      Obx(
                        () => CustomText(
                          text: '${Message.helo} ${controller.nameUser} ! ',
                          color: CustomColors.greyDark,
                          bold: true,
                          type: FontType.h4,
                        ),
                      )
                    ]),
                    const SizedBox(height: _heigthText),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomText(
                            text: Message.toFillRelatory,
                            color: CustomColors.greyDark,
                            bold: true,
                            type: FontType.h5,
                          ),
                        ]),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: Message.name,
                      controller: controller.nameEC,
                      validator: Validatorless.required(Message.required),
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: Message.congregation,
                      controller: controller.congregationEC,
                      validator: Validatorless.required(Message.required),
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: Message.hour,
                      keyboardType: TextInputType.number,
                      controller: controller.hourEC,
                      validator: Validatorless.required(Message.required),
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    Obx(() => CustomDropDown(
                        value: controller.initialValueDrop.value,
                        validator: Validatorless.required(Message.required),
                        onChanged: controller.changeValue,
                        items: controller.mounths
                            .map((mes) => DropdownMenuItem(
                                  value: mes.nome,
                                  child: Text(mes.nome),
                                ))
                            .toList(),
                        labelText: Message.mounth)),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: Message.revisit,
                      keyboardType: TextInputType.number,
                      controller: controller.revisitEC,
                      validator: Validatorless.required(Message.required),
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: Message.study,
                      keyboardType: TextInputType.number,
                      controller: controller.studyEC,
                      validator: Validatorless.required(Message.required),
                    ),
                    const SizedBox(height: DesignTokens.sizeXL),
                    CustomTextFormField(
                      labelText: Message.publication,
                      controller: controller.publicationEC,
                      keyboardType: TextInputType.number,
                      validator: Validatorless.required(Message.required),
                    ),
                    const SizedBox(height: DesignTokens.sizeXXXL),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: CustomButton(
                        type: ButtonType.contained,
                        text: Message.visualize,
                        onPressed: () async {
                          if (controller.keyForm.currentState!.validate()) {
                            controller.makePdf(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
