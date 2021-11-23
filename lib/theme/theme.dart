import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Supreme',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontFamily: "Supreme",
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 35,
      fontFamily: 'Supreme',
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.normal,
      fontFamily: 'CourierNew',
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'CourierNew'
    ),
  );
}
