import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './scrollbutton.dart';
import './customexpansionpanel.dart' as ex;
class ExpnButton extends StatefulWidget {
  final String hint;
  final Widget wiget;
  ExpnButton({this.hint, this.wiget});
  @override
  _ExpnButtonState createState() => _ExpnButtonState(wigt: wiget, text: hint);
}
class _ExpnButtonState extends State<ExpnButton> {
  Widget wigt;
  String text;
  bool expanded = false;
  _ExpnButtonState({this.wigt, this.text});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ex.ExpansionPanelList(
        animationDuration: Duration(milliseconds: 1000),
        elevation: 0,
        children: [
          ex.ExpansionPanel(
            canTapOnHeader: true,
            body: Container(
              child: wigt,
            ),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return DefaultButton(
                text: text,
                onpressed: change,
                icon: null,
              );
            },
            isExpanded: expanded,
          )
        ],
        expansionCallback: (int, bool status) {
          change();
        },
      ),
    );
  }

  change() {
    setState(() {
      expanded = !expanded;
    });
  }
}
