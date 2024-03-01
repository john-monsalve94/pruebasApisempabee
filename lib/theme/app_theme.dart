import 'package:flutter/material.dart';

const colorList = <Color>[
  Color.fromARGB(255, 17, 153, 187),
  Color.fromARGB(255, 247, 167, 51),
  Color.fromARGB(255, 248, 187, 81),
  Color.fromARGB(255, 251, 215, 140),
  Color.fromARGB(255, 4, 83, 17),

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
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        )
      );
}
