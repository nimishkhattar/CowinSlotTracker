import 'package:flutter/material.dart';
import '../../Data/Globalvariable.dart' as global;

class MenuBar extends StatefulWidget {
  const MenuBar({Key key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  void dispose() {
    global.pincode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, _) {
        print('updated');
        print(value);
        return total();
      },
      valueListenable: global.pincode,
    );
  }
}

Widget total() {
  return ListView.builder(
    itemCount: global.pincode.value.length,
    itemBuilder: (context, index) {
      final item = global.pincode.value[index];
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          global.pincode.value.removeAt(index);
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
