import 'package:flutter/material.dart';

class Headerinfo extends StatelessWidget {
  final info;
  Headerinfo(this.info);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(3, 5, 0, 15),
          child: Row(
            children: [
              Expanded(
                flex: 9,
                child: Text(
                  info['name'] + ' ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: info['fee_type'] == 'Free'
                              ? Colors.green
                              : Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        info['fee_type'],
                        style: TextStyle(
                          fontSize: 11,
                          color: info['fee_type'] == 'Free'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  info['pincode'].toString(),
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  info['district_name'],
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'info 3',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
