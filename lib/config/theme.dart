import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Noto',
      textTheme: textTheme());
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        fontSize: 32,
        fontFamily: 'Lato',
        color: Colors.black,
        fontWeight: FontWeight.w500),
    headline2: TextStyle(
        fontSize: 24,
        fontFamily: 'Noto',
        color: Colors.white,
        fontWeight: FontWeight.w500),
    headline3: TextStyle(
        fontSize: 18,
        fontFamily: 'Noto',
        color: Colors.black,
        fontWeight: FontWeight.w500),
    headline4: TextStyle(
        fontSize: 16,
        fontFamily: 'Noto',
        color: Colors.black,
        fontWeight: FontWeight.w500),
    headline5: TextStyle(
        fontSize: 14,
        fontFamily: 'Noto',
        color: Colors.white,
        fontWeight: FontWeight.w500),
    bodyText1: TextStyle(
        fontSize: 12,
        fontFamily: 'Noto',
        color: Colors.black,
        fontWeight: FontWeight.w500),
    bodyText2: TextStyle(
        fontSize: 10,
        fontFamily: 'Noto',
        color: Colors.black,
        fontWeight: FontWeight.w500),
  );
}
