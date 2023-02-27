import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: const Color.fromARGB(0xFF, 0x42, 0xBE, 0xA5),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 22,
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      elevation: MaterialStatePropertyAll(3),
      fixedSize: MaterialStatePropertyAll(
        Size(265, 55),
      ),
    ),
  ),
);
ThemeData darkTheme = ThemeData(primarySwatch: Colors.grey);
