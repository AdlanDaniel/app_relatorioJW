import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

class CustomErrorPage extends StatelessWidget {
  final bool isNetworkError;

  final VoidCallback? onPressed;

  final VoidCallback? onLeadingTap;

  const CustomErrorPage({
    this.isNetworkError = false,
    this.onPressed,
    this.onLeadingTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 72.0, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onLeadingTap ?? Navigator.of(context).pop,
              child: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isNetworkError
                  ? 'Você não está conectado'
                  : 'Ocorreu um erro tente novamente mais tarde!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Por favor, tente novamente mais tarde.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            lottie.Lottie.asset(isNetworkError
                ? 'assets/animations/network_error.json'
                : 'assets/animations/generic_error.json'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: CustomButton(
                type: ButtonType.text,
                text: 'Tente novamente',
                onPressed: onPressed ?? Navigator.of(context).pop,
              ),
            )
          ],
        ),
      ),
    );
  }
}
