import 'package:flutter/material.dart';


class AppTheme{

  final int selectedColor;
  final bool isDarkMode;

  static const colorList = <Color>[
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.teal,
  ];

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  }):assert(selectedColor >= 0, 'Seleciona un color valido');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
  );
}