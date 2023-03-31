import 'package:flutter/material.dart';
import 'package:relatorio_jw_design_system/src/theme/colors.dart';

class RelatorioJwTheme {
  RelatorioJwTheme._();

  static const _kFontFamily = 'Montserrat';

  static ThemeData get lightTheme => ThemeData(
        fontFamily: _kFontFamily,
        iconTheme: _iconThemeData(),
        appBarTheme: _appBarThemeData(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        textButtonTheme: _textButtonThemeData(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
        inputDecorationTheme: _inputDecorationTheme(),
        textSelectionTheme: textSelectionTheme(),
      );

  static IconThemeData _iconThemeData() => const IconThemeData(
        size: 25,
      );
  static AppBarTheme _appBarThemeData() => const AppBarTheme(
        backgroundColor: CustomColors.blueLight,
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.blueLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
      );

  static TextButtonThemeData _textButtonThemeData() => TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: CustomColors.blueLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )));

  static OutlinedButtonThemeData _outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return CustomColors.greyLight;
                }
                return CustomColors.white;
              }),
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return TextStyle(
                    foreground: Paint()..color = CustomColors.greyHeavy,
                    fontFamily: _kFontFamily,
                  );
                }
                return TextStyle(
                  foreground: Paint()..color = CustomColors.blueLight,
                  fontFamily: _kFontFamily,
                );
              }),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return CustomColors.greyHeavy;
                }
                return CustomColors.blueLight;
              }),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return const BorderSide(color: CustomColors.greyHeavy);
                }
                return const BorderSide(color: CustomColors.blueLight);
              })));

  static InputDecorationTheme _inputDecorationTheme() =>
      const InputDecorationTheme(
        floatingLabelStyle:
            TextStyle(fontSize: 20, color: CustomColors.greyMedium),
        labelStyle: TextStyle(
          fontSize: 16,
          color: CustomColors.greyMedium,
        ),
        isDense: true,
        counterStyle: TextStyle(fontFamily: _kFontFamily),
        fillColor: CustomColors.greyLight,
        focusColor: Colors.red,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: CustomColors.greyLight,
            )),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: CustomColors.greyLight,
            )),
      );

  static TextSelectionThemeData textSelectionTheme() =>
      const TextSelectionThemeData(
        cursorColor: CustomColors.greyHeavy,
      );
}
