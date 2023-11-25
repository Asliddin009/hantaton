import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
        fontFamily: 'Montserrat-Medium.ttf'

    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat-Medium.ttf'
    ),
    displaySmall: TextStyle(
      fontSize: 14,
        fontFamily: 'Montserrat-Medium.ttf'

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
