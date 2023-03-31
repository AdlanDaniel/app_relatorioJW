import 'package:flutter/material.dart';

enum ButtonType {
  contained,
  outlined,
  text,
}

class CustomButton extends StatelessWidget {
  final ButtonType type;

  final bool disable;

  final VoidCallback? onPressed;

  final String text;

  const CustomButton({
    super.key,
    required this.type,
    required this.text,
    this.onPressed,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      switch (type) {
        case ButtonType.outlined:
          return OutlinedButton(
            onPressed: disable ? null : onPressed,
            child: Text(text),
          );

        case ButtonType.text:
          return TextButton(
            onPressed: disable ? null : onPressed,
            child: Text(text),
          );

        case ButtonType.contained:
        default:
          return ElevatedButton(
            onPressed: disable ? null : onPressed,
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          );
      }
    });
  }
}
