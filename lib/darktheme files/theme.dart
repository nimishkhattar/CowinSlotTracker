import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff228B22)),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.black),
      );
}
