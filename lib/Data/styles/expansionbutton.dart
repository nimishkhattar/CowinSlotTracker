import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'defaultbutton.dart';
// import './customexpansionpanel.dart' as ex;
// import 'package:provider/provider.dart';

class ExpnButton extends StatefulWidget {
  final expanded;
  final String hint;
  final Widget wiget;
  final upperwig;
  final double padding;
  ExpnButton(
      {this.hint,
      this.wiget,
      this.upperwig,
      this.expanded = false,
      this.padding});
  @override
  _ExpnButtonState createState() => _ExpnButtonState(
      wigt: wiget,
      text: hint,
      upperwig: upperwig,
      expanded: expanded,
      padding: padding);
}

class _ExpnButtonState extends State<ExpnButton> {
  Widget wigt;
  String text;
  bool expanded;
  Widget upperwig;
  double padding;
  _ExpnButtonState(
      {this.wigt, this.text, this.upperwig, this.expanded, this.padding});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        expanded
            ? Padding(
                padding: EdgeInsets.only(top: padding,),
                child: wigt,
              )
            : Padding(padding: EdgeInsets.all(1)),
        InkWell(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          // helor: Theme.of(context).backgroundColor,
          child: ListTile(
            trailing: Icon(expanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,color: Theme.of(context).textTheme.bodyText1.color,),
            // color: Theme.of(context).backgroundColor,
            title: upperwig == null
                ? DefaultButton(
                    text: text,
                    onpressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    icon: null,
                  )
                : upperwig,
          ),
        ),
      ],
    );
    // return ExpansionTile(
    //   title:
    //upperwig == null
    //       ? DefaultButton(
    //           text: text,
    //           onpressed: () {
    //             setState(() {
    //               expanded = !expanded;
    //             });
    //           },
    //           icon: null,
    //         )
    //       : upperwig,
    //   children: [Expanded(child: wigt)],
    // );
    //      return ex.ExpansionPanelList(
    //       animationDuration: Duration(milliseconds: 1000),
    //       elevation: 0,
    //       children: [
    //         ex.ExpansionPanel(
    //           canTapOnHeader: true,
    //           body:  wigt,
    //           headerBuilder: (BuildContext context, bool isExpanded) {
    //             return upperwig == null
    //                 ? DefaultButton(
    //                     text: text,
    //                     onpressed: change,
    //                     icon: null,
    //                   )
    //                 : upperwig;
    //           },
    //           isExpanded: expanded,
    //         )
    //       ],
    //       expansionCallback: (int, bool status) {
    //         change();
    //       },
    //   );
    // }

    // change() {
    //   setState(() {
    //     expanded = !expanded;
    //   });
  }
}
