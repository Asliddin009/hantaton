import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      letterSpacing: 5,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      letterSpacing: 5,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
  primaryColor: Colors.indigo,
  //scaffoldBackgroundColor: ConstColor.DARK_BACKGROUND_COLOR,
  //appBarTheme: AppBarTheme(backgroundColor: ConstColor.DARK_BACKGROUND_COLOR),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white12,
      selectedItemColor: Colors.white),
);
