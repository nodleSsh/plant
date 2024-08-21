import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color(0xFF004643),
    secondary: Color(0xFFC4C4C4),
    tertiary: Color(0xFF757575),
    // inversePrimary: 
  ),
  textTheme:  ThemeData.light().textTheme.apply(
    bodyColor: const Color(0xFF757575),
    // displayColor: 
  ),
);

// Color(0xFF61677A)