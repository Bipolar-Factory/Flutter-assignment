import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.lightBlue,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    headline5: TextStyle(
      color: Colors.black87,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.black87,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: Colors.black54,
      fontSize: 16,
    ),
    subtitle2: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff6c63df),
    selectionColor: Color(0xaa6c63df)
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    labelStyle: TextStyle(
      color: Color(0xff6c63df),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      borderSide: BorderSide(color: Color(0xff6c63ff), width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      borderSide: BorderSide(color: Color(0xff6c63ff), width: 4),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      borderSide: BorderSide(color: Color(0xff6c63ff), width: 2),
    ),
  ),
);
