import 'package:flutter/material.dart';
import 'package:personal_connect/themes/timetable_colors.dart';

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
  colorScheme: ColorScheme.fromSwatch().copyWith(background: Colors.white),
  extensions: const <ThemeExtension<dynamic>>{
    TimetableColors(
      unselected: Color.fromRGBO(0xA9, 0xA9, 0xA9, 1),
      selected1: Color.fromRGBO(0xFF, 0xFA, 0xCD, 1),
      selected2: Color.fromRGBO(0xFF, 0xFF, 0x00, 1),
      selected3: Color.fromRGBO(0xFF, 0x45, 0x00, 1),
      selected4: Color.fromRGBO(0x41, 0x69, 0xE1, 1),
    )
  },
);
ThemeData darkTheme = ThemeData(primarySwatch: Colors.grey);
