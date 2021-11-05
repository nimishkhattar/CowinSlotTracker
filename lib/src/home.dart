import './/src/bypin/tabbypin.dart';
import './/darktheme%20files/theme_model.dart';
import './/src/By_District/Districthome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cowin_slot_tracker/Data/Globalvariable.dart' as global;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Cowin Slot Tracker"),
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
          body: Padding(
            padding: EdgeInsets.all(15),
            child: TabBarView(
              children: [
                DistrictHome(),
                Tabbypin(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(global.where=='district')
              global.districtadded.value = [];
              else if(global.where=='pin')
              global.pinadded.value = [];
            },
            // autofocus: ,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            child: Icon(Icons.search_rounded),
          ),
        ),
      );
    });
  }
}
