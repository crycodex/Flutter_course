import 'package:flutter/material.dart';

const Color _custom = Colors.grey;

const List<Color> colorsThemes = [
  _custom,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.brown,
  Colors.teal,
  Colors.cyan,
];

class AppTheme {
  final int selector;

  AppTheme({this.selector = 0})
    : assert(
        selector >= 0 && selector < colorsThemes.length,
        'El selector debe ser un número entre 0 y ${colorsThemes.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorsThemes[selector],
    );
  }
}
