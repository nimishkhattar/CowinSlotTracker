import 'package:cowin_slot_tracker/Data/styles/expansionbutton.dart';
import 'package:cowin_slot_tracker/src/bypin/menubar.dart';
import 'package:cowin_slot_tracker/src/bypin/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Globalvariable.dart' as global;

class Tabbypin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => global.PinModel(),
      child: Consumer(builder: (context, global.PinModel pinModel, child) {
        return ExpnButton(
          wiget: MenuBar(),
          upperwig: EnterText(),
        );
      }),
    );
  }
}
