import 'package:flutter/material.dart';

class AppTheme {

  bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData themeData() => ThemeData(
    useMaterial3: true,
    colorScheme: isDarkMode?
      const ColorScheme.highContrastDark(
      primary: Colors.orange
    ):const ColorScheme.highContrastLight(
      primary: Colors.orange
    ),
    brightness: isDarkMode?Brightness.dark:Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: true
    )
  );

  AppTheme copyWith({bool? isDarkMode})=> AppTheme(isDarkMode: isDarkMode??false);

}