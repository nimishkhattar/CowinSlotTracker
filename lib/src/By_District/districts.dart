import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../Data/Globalvariable.dart' as global;
// import './customexpansionpanel.dart' as ex;

class Districtslayout extends StatefulWidget {
  @override
  _DistrictslayoutState createState() => _DistrictslayoutState();
}

class _DistrictslayoutState extends State<Districtslayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, global.DistrictModel districtModel, child) {
      return _totalwig(districtModel.district);
    });
  }

  _totalwig(districts) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: _createwig(districts),
    );
  }

  _createwig(districts) {
    List<Widget> columnContent = [];
    for (dynamic dis in districts) {
      columnContent.add(
        ListTile(
          title: Text(
            dis['district_name'],
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
    return columnContent;
  }
}
