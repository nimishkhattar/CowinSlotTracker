import 'package:flutter/material.dart';
import '../../Data/Globalvariable.dart' as global;
import 'package:provider/provider.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, global.PinModel pinModel, child) {
      global.noofstates = 37;
      return ListView.builder(
        itemCount: pinModel.pincode.length,
        itemBuilder: (context, index) {
          final item = pinModel.pincode[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              pinModel.removeAt(index);
              // });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item Removed')));
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(item ?? 'Enter Pin'),
            ),
          );
        },
      );
    });
  }
}
