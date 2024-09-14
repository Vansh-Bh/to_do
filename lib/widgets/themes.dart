import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[850],
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      titleTextStyle: const TextStyle(
          fontFamily: 'Nunito', fontWeight: FontWeight.w900, fontSize: 18),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: AppBarTheme(
      color: Colors.grey[100],
      titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w900,
          fontSize: 18),
    ),
  );
}
