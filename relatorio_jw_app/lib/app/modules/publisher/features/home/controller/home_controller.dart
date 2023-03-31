import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/service/home_service.dart';
import 'package:relatorio_jw_app/app/modules/publisher/resources/messages.dart';
import 'package:relatorio_jw_app/app/modules/publisher/resources/model/mounth.dart';
import 'package:relatorio_jw_app/app/routes/app_routes.dart';

enum Status {
  initial,
  success,
  loading,
  errorNetworking,
  errorGeneric,
}

class HomeController extends GetxController {
  HomeService homeService;
  HomeController({
    required this.homeService,
  });
  TextEditingController nameEC = TextEditingController();
  TextEditingController congregationEC = TextEditingController();
  TextEditingController hourEC = TextEditingController();
  TextEditingController mounthEC = TextEditingController();
  TextEditingController revisitEC = TextEditingController();
  TextEditingController studyEC = TextEditingController();
  TextEditingController publicationEC = TextEditingController();

  final keyForm = GlobalKey<FormState>();
  final initialValueDrop = Rxn<String>(null);

  RxList mounths = <Mounth>[].obs;
  Rx<Status> statu = Status.initial.obs;

  void clearFields() {
    nameEC.clear();
    congregationEC.clear();
    hourEC.clear();
    mounthEC.clear();

    revisitEC.clear();
    studyEC.clear();
    publicationEC.clear();
    initialValueDrop.value = null;
  }

  void setStatus(Status status) {
    statu.value = status;
  }

  Future<void> getMounth() async {
    final response = await rootBundle.loadString('assets/mounth.json');
    List<Map<String, dynamic>> mounthss =
        ((jsonDecode(response)) as List).cast();
    mounthss.forEach((element) {
      Mounth mounth = Mounth.fromMap(element);
      mounths.add(mounth);
    });
  }

  void changeValue(value) {
    initialValueDrop.value = value;
    mounthEC.text = value;
  }

  String dateNow() {
    final now = DateTime.now();
    final format = DateFormat("dd' de' MMMM 'de' y", 'pt_BR').format(now);
    return format;
  }

  RxString nameUser = ''.obs;

  Future<void> getPublisher(BuildContext context) async {
    setStatus(Status.loading);
    UserPublisher publisher;

    try {
      publisher = await homeService.getPublisher();
      nameUser.value = publisher.name ?? '';
      setStatus(Status.success);
    } on HomeServiceError catch (error) {
      if (error is HomeServiceNetworkError) {
        Navigator.pushReplacementNamed(context, AppRoutes.errorNetworkPage);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.errorGenericPage);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      setStatus(Status.loading);
      await homeService.signOut();
      Navigator.pushReplacementNamed(context, AppRoutes.initialPage);
      // Navigator.pop(context);
    } on HomeServiceError catch (error) {
      if (error is HomeServiceNetworkError) {
        Navigator.pushNamed(context, AppRoutes.errorNetworkPage);
      } else {
        Navigator.pushNamed(context, AppRoutes.errorGenericPage);
      }
    }
  }

  Future makePdf(BuildContext context) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(pdfLib.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pdfLib.Column(children: [
          pdfLib.Text('${Message.name}: ${nameEC.text}'),
          pdfLib.SizedBox(height: 10),
          pdfLib.Text('${Message.congregation}: ${congregationEC.text}'),
          pdfLib.SizedBox(height: 20),
          pdfLib.Table(border: pdfLib.TableBorder.all(), children: [
            pdfLib.TableRow(children: [
              pdfLib.SizedBox(
                  height: 30,
                  child: pdfLib.Center(
                      child:
                          pdfLib.Text('${Message.mounth}: ${mounthEC.text}')))
            ])
          ]),
          pdfLib.Table(border: pdfLib.TableBorder.all(), children: [
            pdfLib.TableRow(children: [
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(Message.hour))),
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(Message.revisit))),
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(Message.study))),
              pdfLib.SizedBox(
                  height: 25,
                  child:
                      pdfLib.Center(child: pdfLib.Text(Message.publication))),
            ]),
            pdfLib.TableRow(children: [
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(hourEC.text))),
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(revisitEC.text))),
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(studyEC.text))),
              pdfLib.SizedBox(
                  height: 25,
                  child: pdfLib.Center(child: pdfLib.Text(publicationEC.text))),
            ])
          ]),
          pdfLib.SizedBox(height: 40),
        ]);
      },
    ));
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/pdfExemplo.pdf';
    final File file = File(path);

    file.writeAsBytesSync(await pdf.save());
    clearFields();

    Navigator.pushNamed(context, AppRoutes.pdfPage, arguments: file);
  }

  // Future <Uint8List> createPdf(
  //     BuildContext context, String name, String lastName, String year) async {
  //   final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
  //   pdf.addPage(pdfLib.MultiPage(
  //       build: (context) => [
  //             pdfLib.Table.fromTextArray(data: <List<String>>[
  //               <String>['Nome', 'Sobrenome', 'Ano'],
  //               [name, lastName, year]
  //             ])
  //           ]));
  //   final String dir = (await getApplicationDocumentsDirectory()).path;
  //   final String path = '$dir/pdfExemplo.pdf';
  //   final File file = File(path);
  //   file.writeAsBytesSync(pdf.save() as List<int> );
  //   return pdf.save();
  //   // Navigator.push(context,
  //   //     MaterialPageRoute(builder: (context) => PfdScreen(filePDF: file)));
  // }
}
