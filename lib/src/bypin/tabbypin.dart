import 'package:cowin_slot_tracker/Data/expansionbutton.dart';
import 'package:cowin_slot_tracker/src/bypin/menubar.dart';
import 'package:cowin_slot_tracker/src/bypin/textfield.dart';
import 'package:flutter/material.dart';
import '../../Data/Globalvariable.dart' as global;

class Tabbypin extends StatefulWidget {
  // const Tabbypin({ Key key }) : super(key: key);

  @override
  _TabbypinState createState() => _TabbypinState();
}

class _TabbypinState extends State<Tabbypin> {
  @override
  void initState() {
    global.pincode = ValueNotifier<List<String>>(['Select Pin']);
    super.initState();
  }

  @override
  void dispose() {
    global.pincode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget kk() {
      return ExpnButton(
        wiget: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 10,
          child: Padding(
            child: MenuBar(
              key: UniqueKey(),
            ),
            padding: EdgeInsets.all(19),
          ),
        ),
        upperwig: EnterText(),
      );
    }

    return Column(
      children: [
        Flexible(
          child: ValueListenableBuilder(
            builder: (context, value, _) {
              print('update');
              return kk();
            },
            valueListenable: global.pincode,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {
            print(global.pincode.value);
          },
          child: Text('find'),
        )
      ],
    );
  }
}
