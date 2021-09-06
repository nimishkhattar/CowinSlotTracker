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
    return Stack(
      children: [
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 90)),
            Divider(
              thickness: 2,
            ),
            Expanded(child: Pinview()),
          ],
        ),
        ChangeNotifierProvider(
          create: (_) => global.PinModel(),
          child: Consumer(
            builder: (context, global.PinModel pinModel, child) {
              return SingleChildScrollView(
                child: ExpnButton(
                  wiget: SizedBox(
                    child: MenuBar(),
                    height: 200,
                  ),
                  upperwig: EnterText(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
