import 'darktheme%20files/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'darktheme files/theme.dart';
import 'src/home.dart';
import 'package:cowin_slot_tracker/src/update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: fetchstates(
          url: 'https://cdn-api.co-vin.in/api/v2/admin/location/states'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChangeNotifierProvider(
            create: (_) => ThemeModel(),
            child:
                Consumer(builder: (context, ThemeModel themeNotifier, child) {
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
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Center(
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
