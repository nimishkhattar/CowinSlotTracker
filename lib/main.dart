import 'package:CoWin_Slot_Tracker/darktheme%20files/theme_model.dart';
import 'package:CoWin_Slot_Tracker/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(),
        );
      }),
    );
  }
}
