import 'package:cowin_slot_tracker/Data/styles/expansionbutton.dart';
import 'package:cowin_slot_tracker/src/Displaydata/pinview.dart';
import 'package:cowin_slot_tracker/src/bypin/menubar.dart';
import 'package:cowin_slot_tracker/src/bypin/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Globalvariable.dart' as global;

class Tabbypin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    global.noofstates = 37;
    global.where = 'pin';
    // print(global.where);
    return Stack(
      children: [
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 70)),
            Divider(
              thickness: 2,
            ),
            Expanded(child: Pinview()),
          ],
        ),
        ChangeNotifierProvider(
          create: (_) => global.PinModel(),
          child: Consumer(
            child: MenuBar(),
            builder: (context, global.PinModel pinModel, child) {
              return ExpnButton(
                wiget: child,
                upperwig: EnterText(),
                padding: 75,
              );
            },
          ),
        ),
      ],
    );
  }
}
