import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './scrollbutton.dart';

class ExpnButton extends StatefulWidget {
  final String hint;
  final Widget wiget;
  ExpnButton({this.hint, this.wiget});
  @override
  _ExpnButtonState createState() => _ExpnButtonState(wig: wiget, text: hint);
}

class _ExpnButtonState extends State<ExpnButton> {
  Widget wig;
  String text;
  _ExpnButtonState({this.wig, this.text});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 1000),
        // elevation: 0,
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            body: Container(
              child: wig,
            ),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                  child: DefaultButton(
                text: text,
                onpressed: change,
                icon: null,
              ));
            },
            isExpanded: districts.expanded,
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
      districts.expanded = !districts.expanded;
    });
  }

  Model districts = Model(
    headerItem: 'Select Districts',
  );
}

class Model {
  bool expanded = false;
  String headerItem;
  String discription;
  Model({this.headerItem, this.discription});
}
