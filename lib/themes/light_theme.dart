import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.grey[600] as Color),
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        centerTitle: true),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey[300] as Color,
      primary: const Color.fromARGB(255, 119, 119, 119) as Color,
      secondary: Color.fromARGB(255, 230, 1, 1) as Color,
    ));
