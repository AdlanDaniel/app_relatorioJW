import 'package:flutter/material.dart';
import 'package:relatorio_jw_design_system/src/widgets/custom_button.dart';

class CustomBottomSheet {
  showAlertDialog(
    BuildContext context, {
    Widget? body,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showModalBottomSheet<Object?>(
      context: context,
      builder: (builder) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                onCancel?.call();

                Navigator.of(context).pop();
              },
              constraints: const BoxConstraints(),
              splashRadius: 18,
              icon: const Icon(
                Icons.close,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Titulo do que se trata!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
                'A descricao é do bottom sheet serve apenas para descrever algo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: 15),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SafeArea(
                  bottom: true,
                  child: Row(
                    children: [
                      CustomButton(
                        type: ButtonType.text,
                        text: 'Voltar',
                        onPressed: () {
                          onCancel?.call();
                          Navigator.of(context).pop();
                        },
                      ),
                      const Spacer(),
                      CustomButton(
                        type: ButtonType.contained,
                        text: 'Confirmar',
                        onPressed: () {
                          onConfirm?.call();

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
