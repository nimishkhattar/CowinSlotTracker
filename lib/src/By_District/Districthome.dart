import 'package:cowin_slot_tracker/Data/styles/expansionbutton.dart';
import 'package:cowin_slot_tracker/src/Displaydata/districtview.dart';

import '../../src/By_District/states.dart';
import 'package:flutter/material.dart';
import './districts.dart';
import 'package:provider/provider.dart';
import '../../Data/Globalvariable.dart' as global;

class DistrictHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DistrictHomeState();
}

class DistrictHomeState extends State<DistrictHome> {
  @override
  Widget build(BuildContext context) {
    return
        Stack(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 120)
                    // color: Colors.white.withOpacity(1),
                    ),
                Divider(
                  thickness: 2,
                ),
                Expanded(child: Singlesession()),
              ],
            ),
        ChangeNotifierProvider(
      create: (_) => global.DistrictModel(),
      child: Consumer(builder: (context, global.DistrictModel pinModel, child) {
        return Column(
          children: [
            SizedBox(height: 60, child: StateMenu()),
            // SizedBox(
            //     child: ExpnButton(
            //   wiget: ConstrainedBox(
            //     child: Districtslayout(),
            //     constraints: BoxConstraints(
            //         maxHeight: MediaQuery.of(context).size.height * (0.6)),
            //   ),
            //   hint: 'Select Districts',
            // )),
            Expanded(
              child: ExpnButton(
                wiget: Districtslayout(),
                hint: 'Select Districts',
                padding:70 ,
              ),
            ),
          ],
        );
      }),
        ),
      ],
    );
  }
}
