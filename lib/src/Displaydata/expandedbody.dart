import 'package:flutter/material.dart';

class Expandedbody extends StatelessWidget {
  final ssession;
  Expandedbody(this.ssession);
  @override
  Widget build(BuildContext context) {
    Widget wig(ssion) {
      return Column(
        children: [
          Text(ssion['date']),
          Row(
            children: [
              Container(
                color: ssion['available_capacity_dose1']== 0
                    ? Colors.redAccent
                    : Colors.greenAccent,
                child: Text(
                  'D1' + ssion['available_capacity_dose1'].toString(),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                color: ssion['available_capacity_dose2'] == 0
                    ? Colors.redAccent
                    : Colors.greenAccent,
                child: Text(
                  'D1' + ssion['available_capacity_dose2'].toString(),
                ),
              ),
            ],
          ),
          Text(ssion['vaccine']),
          ...(ssion['slots'] as List<dynamic>).map(
            (sess) {
              return Text(sess);
            },
          ).toList(),
        ],
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...(ssession as List<dynamic>).map((session) {
            return wig(session);
          }).toList(),
        ],
      ),
    );
  }
}
