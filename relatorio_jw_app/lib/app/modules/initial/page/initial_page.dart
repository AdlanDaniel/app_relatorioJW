import 'package:flutter/material.dart';
import 'package:relatorio_jw_app/app/modules/initial/resources/messages.dart';
import 'package:relatorio_jw_app/app/routes/app_routes.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

const _sizeTop = 165.0;
const _sizeBottom = 96.0;

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        floatingActionButton: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              color: CustomColors.blueLight,
              size: DesignTokens.sizeXXL,
            )),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(
                    top: _sizeTop,
                    left: DesignTokens.sizeXL,
                    right: DesignTokens.sizeXL),
                child: Column(children: [
                  Image.asset(
                    'assets/imagem/imagemPagInitial.png',
                  ),
                  const SizedBox(height: _sizeBottom),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: DesignTokens.sizeXXXL,
                      child: CustomButton(
                        type: ButtonType.contained,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.loginPublisher);
                        },
                        text: Messages.publisher,
                      )),
                  const SizedBox(height: DesignTokens.sizeXXL),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: DesignTokens.sizeXXXL,
                      child: const CustomButton(
                          type: ButtonType.contained,
                          text: Messages.congregation))
                ]))));
  }
}
