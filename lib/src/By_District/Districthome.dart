
import '../../src/By_District/states.dart';
import 'package:flutter/material.dart';
import '../../src/By_District/districtbase.dart';

class DistrictHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DistrictHomeState();
}
class DistrictHomeState extends State<DistrictHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 110)
                // color: Colors.white.withOpacity(1),
              ),
              Divider(
                thickness: 2,
              ),
              Text("hey"),
            ],
          ),
          Column(
            children: [
              new SizedBox(height: 50, child: StateMenu()),
              new Flexible(child: Districtslayout()),
            ],
          ),
        ],
      ),
    );
  }
}