import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

const _heigthAppBar = 62.0;

class PdfPage extends StatefulWidget {
  final File file;
  const PdfPage({Key? key, required this.file}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  void initState() {
    readFile();
    super.initState();
  }

  Uint8List readFile() {
    return widget.file.readAsBytesSync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: PdfPreview(
        initialPageFormat: PdfPageFormat.a4,
        canChangePageFormat: false,
        canDebug: false,
        pdfFileName: 'relatorio',
        build: (context) => readFile(),
      ),
    );
  }
}
