import 'package:cowin_slot_tracker/src/Displaydata/Expansion.dart';
import 'package:cowin_slot_tracker/src/update.dart';
import 'package:flutter/material.dart';
import 'package:cowin_slot_tracker/Data/Globalvariable.dart' as global;

class Singlesession extends StatelessWidget {
  Future<int> fetching() async {
    for (int district in global.listeddistricts) {
      await fetchesults('District', district.toString());
      // print(pin);
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: global.districtadded,
      builder: (context, data, child) {
        return FutureBuilder<int>(
          future: fetching(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, snapshot) {
                  global.expanded.add(false);
                  return Expandeddetails(data, snapshot);
                },
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
      },
    );
  }
}
