import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  cardColor: Colors.deepOrange[100],
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.black54,
      titleTextStyle: TextStyle(color: Colors.deepOrange[100])),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black54,
      selectedItemColor: Colors.deepOrange[100]),
  buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrange[100]),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange[100]),
  ),
  textTheme: _textLight(_themeLight.textTheme),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
      //bodyLarge: base.bodyLarge!.copyWith(color: Colors.deepOrange[100]),
      //bodyMedium: base.bodyMedium!.copyWith(color: Colors.deepOrange[100])
      );
}
