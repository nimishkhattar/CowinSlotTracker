import 'package:cowin_slot_tracker/Data/expansionbutton.dart';
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
      child: Consumer(builder: (context, global.PinModel themeNotifier, child) {
        print('ugb');
        return FinalWidget();
      }),
    );
  }
}

class FinalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget kk() {
      return ExpnButton(
        wiget: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 10,
          child: Padding(
            child: MenuBar(),
            padding: EdgeInsets.all(19),
          ),
        ),
        upperwig: EnterText(),
      );
    }

    return Column(
      children: [
        Flexible(
          child: kk(),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {
            print(global.pincode.pincode);
          },
          child: Text('find'),
        )
      ],
    );
  }
}
