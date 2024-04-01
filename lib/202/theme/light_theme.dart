import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  //debugda çalışırken bu şekilde kullanılabilir
  //*build alacakken performans için final keywordu de eklenme
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)))),
        colorScheme: const ColorScheme.light(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _lightColor.frozenState));
  }
}

class _LightColor {
  final Color frozenState = const Color.fromARGB(255, 43, 253, 239);
  final Color paladium = const Color.fromARGB(255, 176, 176, 176);
}
