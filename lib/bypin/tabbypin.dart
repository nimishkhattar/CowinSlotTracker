import 'package:flutter/material.dart';


class Tabbypin extends StatefulWidget {
  @override
  _TabbypinState createState() => _TabbypinState();
}

class _TabbypinState extends State<Tabbypin> {
  String name='';
  List <String> pincode=[];



void addItemToList(){
  pincode.add(name);
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(

          padding: const EdgeInsets.only(top:30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: TextField(
              onChanged: (value) {
                name = value;

              },


              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.pin_drop),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                hintText: " Enter pin code",
                labelText: "Pin Code"

              ),

            ),
          ),

        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {
            addItemToList();
            print(pincode);
          },
          child: Text('find'),
        )
      ],
    );

}
}
