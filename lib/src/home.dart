import './/src/bypin/tabbypin.dart';
import './/darktheme%20files/theme_model.dart';
import './/src/By_District/Districthome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Cowin Tracker"),
            actions: [
              IconButton(
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                  icon: Icon(themeNotifier.isDark
                      ? Icons.wb_sunny
                      : Icons.nightlight_round))
            ],
            bottom: TabBar(
              tabs: [Tab(text: "By District"), Tab(text: "By Pin")],
            ),
          ),
          body: TabBarView(
            children: [
              DistrictHome(),
              Tabbypin(),
            ],
          ),
        ),
      );
    });
  }
}
