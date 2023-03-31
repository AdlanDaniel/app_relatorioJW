import 'package:flutter/material.dart';

class PosRegistterPageTeste extends StatefulWidget {
  const PosRegistterPageTeste({Key? key}) : super(key: key);

  @override
  State<PosRegistterPageTeste> createState() => _PosRegistterPageTesteState();
}

class _PosRegistterPageTesteState extends State<PosRegistterPageTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina teste'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Deu certo'),
        ],
      )),
    );
  }
}
