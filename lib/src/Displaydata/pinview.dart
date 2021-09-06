import 'package:cowin_slot_tracker/src/update.dart';
import 'package:flutter/material.dart';
import 'package:cowin_slot_tracker/src/Displaydata/Expansion.dart';
import 'package:cowin_slot_tracker/Data/Globalvariable.dart' as global;

class Pinview extends StatefulWidget {
  @override
  _PinviewState createState() => _PinviewState();
}

class _PinviewState extends State<Pinview> {
  Future<int> fetching() async {
    for (String pin in global.listedpin) {
      await fetchesults('Pin', pin);
      // print(pin);
    }
    print('object');
    // bool h;
    // if(h)
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: global.pinadded,
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
