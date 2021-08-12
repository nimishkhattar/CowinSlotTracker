import 'darktheme%20files/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'darktheme files/theme.dart';
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
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDark
              ? MyTheme.lightTheme(context)
              : MyTheme.darkTheme(context),
          home: HomePage(),
        );
      }),
    );
  }
}
