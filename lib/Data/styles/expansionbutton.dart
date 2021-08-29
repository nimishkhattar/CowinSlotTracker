import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './scrollbutton.dart';
import './customexpansionpanel.dart' as ex;
// import 'package:provider/provider.dart';

class ExpnButton extends StatefulWidget {
  final expanded;
  final String hint;
  final Widget wiget;
  final upperwig;
  ExpnButton({this.hint, this.wiget, this.upperwig, this.expanded = false});
  @override
  _ExpnButtonState createState() => _ExpnButtonState(
      wigt: wiget, text: hint, upperwig: upperwig, expanded: expanded);
}

class _ExpnButtonState extends State<ExpnButton> {
  Widget wigt;
  String text;
  bool expanded = false;
  Widget upperwig;
  _ExpnButtonState({this.wigt, this.text, this.upperwig, this.expanded});
  @override
  Widget build(BuildContext context) {
    return 
        ex.ExpansionPanelList(
        animationDuration: Duration(milliseconds: 1000),
        elevation: 0,
        children: [
          ex.ExpansionPanel(
            canTapOnHeader: true,
            body:  wigt,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return upperwig == null
                  ? DefaultButton(
                      text: text,
                      onpressed: change,
                      icon: null,
                    )
                  : upperwig;
            },
            isExpanded: expanded,
          )
        ],
        expansionCallback: (int, bool status) {
          change();
        },
    );
  }

  change() {
    setState(() {
      expanded = !expanded;
    });
  }
}
