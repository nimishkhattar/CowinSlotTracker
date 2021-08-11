import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Data/Globalvariable.dart' as global;
import '../../Data/scrollbutton.dart';
// import './customexpansionpanel.dart' as ex;

class Districtslayout extends StatefulWidget {
  @override
  _DistrictslayoutState createState() => _DistrictslayoutState();
}

class _DistrictslayoutState extends State<Districtslayout> {
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
              child: _totalwig(),
            ),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                  child: DefaultButton(
                text: districts.headerItem,
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

  _totalwig() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: _createwig(),
    );
  }

  _createwig() {
    List<Widget> columnContent = [];
    int i = 0;
    for (String content in global.districts) {
      i++;
      columnContent.add(
        ListTile(
          title: Text(
            "Test" + i.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }

    return columnContent;
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
