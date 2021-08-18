import 'package:flutter/material.dart';
import '../../Data/Globalvariable.dart' as global;

class MenuBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('helloji');
    return total();
  }
}

Widget total() {
  return ListView.builder(
    itemCount: global.pincode.pincode.length,
    itemBuilder: (context, index) {
      final item = global.pincode.pincode[index];
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          global.pincode.removeAt(index);
          // });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$item Removed')));
        },
        background: Container(color: Colors.red),
        child: ListTile(
          title: Text(item),
        ),
      );
    },
  );
}
