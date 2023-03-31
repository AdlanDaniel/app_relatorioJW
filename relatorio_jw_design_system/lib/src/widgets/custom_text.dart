import 'package:flutter/material.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

class CustomText extends StatelessWidget {
  final String text;

  final bool bold;

  final bool isHighline;

  final bool overflow;

  final Color? color;

  final TextOverflow textOverflow;

  final FontType type;

  final TextDecoration decoration;

  final Color decorationColor;

  final bool upperCase;

  final TextAlign? textAlign;

  final int? maxLines;

  const CustomText({
    required this.text,
    this.bold = false,
    this.isHighline = false,
    this.overflow = false,
    this.textOverflow = TextOverflow.ellipsis,
    this.type = FontType.body,
    this.decoration = TextDecoration.none,
    this.decorationColor = CustomColors.white,
    this.upperCase = false,
    this.maxLines,
    this.textAlign,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = type.style(
      decoration: decoration,
      decorationColor: decorationColor,
      color: color,
      bold: bold,
      isHighLine: isHighline,
    );
    return Text(
      upperCase ? text.toUpperCase() : text,
      overflow: overflow ? textOverflow : null,
      maxLines: maxLines,
      textAlign: textAlign,
      style: style,
    );
  }
}

enum FontType {
  h1,
  h2,
  h3,
  h4,
  h5,
  body,
  label,
}

extension FontTypeExtension on FontType {
  TextStyle style({
    bool bold = false,
    bool isHighLine = false,
    TextDecoration? decoration,
    Color? color,
    Color? decorationColor,
  }) =>
      TextStyle(
        decoration: decoration,
        color: color ?? defaultColor,
        decorationColor: decorationColor ?? Colors.white,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 2,
        fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
        height: isHighLine ? 1.4 : 1,
        fontSize: fontSize,
      );

  Color get defaultColor {
    switch (this) {
      case FontType.body:
        return CustomColors.bodyColor;

      default:
        return CustomColors.black;
    }
  }

  double get fontSize {
    switch (this) {
      case FontType.h1:
        return DesignTokens.sizeXXXL;
      case FontType.h2:
        return DesignTokens.sizeXXL;
      case FontType.h3:
        return DesignTokens.sizeXL;
      case FontType.h4:
        return DesignTokens.sizeXL;
      case FontType.h5:
        return DesignTokens.sizeL;
      case FontType.body:
        return DesignTokens.sizeM;
      case FontType.label:
        return DesignTokens.sizeSM;
      default:
        return DesignTokens.sizeM;
    }
  }
}
