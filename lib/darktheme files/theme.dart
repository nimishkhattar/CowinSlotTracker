import 'package:flutter/material.dart';

// import '../Data//scrollbutton.dart';
class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white30),
          ),
        ),
        textTheme: TextTheme(bodyText1: TextStyle().apply(color: Colors.white)),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Color(0xff228B22)),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        accentColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        buttonColor: Colors.red,
        
      );
}
