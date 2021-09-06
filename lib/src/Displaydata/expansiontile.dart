import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'expandedbody.dart';
import 'header.dart';
import 'package:cowin_slot_tracker/Data/Globalvariable.dart' as global;


class Singleses extends StatefulWidget {

  @override
  _SinglesesState createState() => _SinglesesState();
}

class _SinglesesState extends State<Singleses> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: global.data.length,
      itemBuilder: (context, snap) {
        return ExpansionTile(
          title: Headerinfo(global.data[snap]),
          // trailing: SizedBox.shrink(),
          children: [Expandedbody(global.data[snap]['sessions'])],
        );
      },
    );
  }
}
