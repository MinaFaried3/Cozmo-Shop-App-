import 'package:flutter/material.dart';

Color CozmoColor = Color(0xff7a3851);
Color CozmoColor1 = Color(0xffe1a9be);
Color CozmoColor2 = Color(0xffbd6080);
Color CozmoColor3 = Color(0xfff1cddc);
Color CozmoColor4 = Color(0xfffce3ee);
Color CozmoColor5 = Color(0xff9a4a68);
Color CozmoShadow = Color(0x8de2789c);
Color CozmoColor6 = Color(0xff551a32);
Color CozmoColor7 = Color(0xffd27594);
Color CozmoColor8 = Color(0xfff6e7ef);
Color CozmoText = Color(0xff183644);
Color CozmoText1 = Color(0xff2c5971);
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
