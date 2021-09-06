import 'package:flutter/material.dart';
import 'package:cowin_slot_tracker/Data/Globalvariable.dart' as global;
import 'expandedbody.dart';
import 'header.dart';

class Expandeddetails extends StatefulWidget {
  final details;
  final snapshot;
  Expandeddetails(this.details, this.snapshot);
  @override
  _ExpandeddetailsState createState() =>
      _ExpandeddetailsState(details, snapshot);
}

class _ExpandeddetailsState extends State<Expandeddetails> {
  final data;
  final snapshot;
  _ExpandeddetailsState(this.data,this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ExpansionPanelList(
        // dividerColor: Colors.redAccent,
        animationDuration: Duration(milliseconds: 1000),
        elevation: 24,
        children: [
          ExpansionPanel(

              // backgroundColor: Colors.redAccent,
              isExpanded: global.expanded[snapshot],
              headerBuilder: (context, isExpanded) {
                return Headerinfo(data[snapshot]);
              },
              body: Expandedbody(data[snapshot]['sessions'])),
        ],
        expansionCallback: (int item, bool status) {
          setState(
            () {
              global.expanded[snapshot] = !global.expanded[snapshot];
            },
          );
        },
      ),
    );
  }
}
