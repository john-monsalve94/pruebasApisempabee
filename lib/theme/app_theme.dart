import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFFF7A733),
  Color(0xFFf8bb51),
  Color(0xFFfbd78c),

];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'Seleccione un color de la paleta mayor o igual a 0'),
        assert(selectedColor < colorList.length,
            'el color seleccionado debe ser menor que ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
      );
}
