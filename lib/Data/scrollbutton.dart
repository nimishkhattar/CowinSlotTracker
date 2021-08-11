import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final text;
  final icon;
  final inner;
  final onpressed;
  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(fontSize: 18.0),),
    );
  }

  DefaultButton(
      {this.text,
      this.icon = Icons.arrow_drop_down,
      this.inner,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            // side: BorderSide(color: Colors.red),
          ),
        ),
      ),
      onPressed: onpressed,
      child: Stack(
        children: <Widget>[
          inner != null ? inner : _buildItem(context),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(icon),
          )
        ],
      ),
    ));
  }
}
