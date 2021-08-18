import 'package:flutter/material.dart';
import '../../Data/Globalvariable.dart' as global;
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EnterText extends StatelessWidget {
  String pin;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, global.PinModel pinModel, child) {
          print('text');

      return SizedBox(
        height: 80,
        child: TextField(
          onChanged: (value) {
            pin = value;
          },
          maxLength: 6,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              icon: Icon(Icons.pin_drop),
              suffix: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  pinModel.add(pin);
                },
                child: Text('Add'),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: " Enter pin code",
              labelText: "Pin Code"),
        ),
      );
    });
  }
}
