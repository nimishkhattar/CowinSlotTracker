import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import '../../data/scrollbutton.dart';
import '../../Data/Globalvariable.dart' as global;
// import 'package:cupertino_icons/cupertino_icons.dart';

class StateMenu extends StatefulWidget {
  @override
  _StateMenuState createState() => _StateMenuState();
}

class _StateMenuState extends State<StateMenu> {
  int selectedIndex1 = 0;
  List<Widget> _buildItems1() {
    return global.states
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DirectSelect(
                  itemExtent: 50.0,
                  selectedIndex: selectedIndex1,
                  backgroundColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.92),
                  child: MySelectionItem(
                    isForList: false,
                    title: global.states[selectedIndex1],
                  ),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedIndex1 = index;
                    });
                  },
                  items: _buildItems1()),
            ]),
      ),
    );
  }
}

//You can use any Widget
class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;
  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(5),
            )
          : DefaultButton(
              icon: CupertinoIcons.arrow_up_arrow_down_circle_fill,
              text: title,
              onpressed: () {}, //not of any use here
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
