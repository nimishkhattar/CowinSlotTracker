import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xff228B22)),
        brightness: Brightness.dark,
        accentColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      );
}
