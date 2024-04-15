import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF0000FF);

List<Color> _myColors = [
  _customColor,
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.blue,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 4})
      : assert(selectedColor >= 0 && selectedColor < _myColors.length,
            'Selected color must to be >= to 0 and < to ${_myColors.length - 1}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _myColors[selectedColor],
      brightness: Brightness.light,
      // appBarTheme: AppBarTheme(backgroundColor: _myColors[selectedColor])
    );
  }
}
