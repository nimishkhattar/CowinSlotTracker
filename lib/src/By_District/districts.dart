import '../../Data/expansionbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Data/Globalvariable.dart' as global;
// import './customexpansionpanel.dart' as ex;

class Districtslayout extends StatefulWidget {
  @override
  _DistrictslayoutState createState() => _DistrictslayoutState();
}

class _DistrictslayoutState extends State<Districtslayout> {
  @override
  Widget build(BuildContext context) {
    return ExpnButton(wiget: _totalwig(), hint: "Select Districts");
  }

  _totalwig() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: _createwig(),
    );
  }

  _createwig() {
    List<Widget> columnContent = [];
    int i = 0;
    for (String _ in global.districts) {
      i++;
      columnContent.add(
        ListTile(
          title: Text(
            "Test" + i.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
    return columnContent;
  }
}
