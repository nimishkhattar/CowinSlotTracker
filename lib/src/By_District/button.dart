import 'package:flutter/material.dart';
import 'package:cowin_slot_tracker/Data/Globalvariable.dart' as global;

class Buttoncustom extends StatefulWidget {
  final district;
  Buttoncustom(this.district);
  @override
  _ButtoncustomState createState() => _ButtoncustomState(district);
}

class _ButtoncustomState extends State<Buttoncustom> {
  final district;
  bool selected = false;
  _ButtoncustomState(this.district);
  @override
  Widget build(BuildContext context) {
    if (!global.selecteddistricts
        .containsKey(district['district_id']))
      global.selecteddistricts[district['district_id']] =
          false;
    return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    global.selecteddistricts[district
                            ['district_id']]
                        ? Colors.green[400]
                        : null),
                elevation: MaterialStateProperty.all(global.selecteddistricts[
                        district['district_id']]
                    ? 24
                    : 0),
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60),
                ),
              ),
              child: Text(
                district['district_name'],
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(
                  () {
                    global.selecteddistricts[district
                            ['district_id']] =
                        !global.selecteddistricts[district
                            ['district_id']];
                    if (global.selecteddistricts[district
                        ['district_id']])
                      global.listeddistricts
                          .add(district['district_id']);
                    else
                      global.listeddistricts
                          .remove(district['district_id']);
                  },
                );
              });
  }
}
