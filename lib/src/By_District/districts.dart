import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../Data/Globalvariable.dart' as global;
// import './customexpansionpanel.dart' as ex;

class Districtslayout extends StatefulWidget {
  @override
  _DistrictslayoutState createState() => _DistrictslayoutState();
}

class _DistrictslayoutState extends State<Districtslayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, global.DistrictModel districtModel, child) {
      return _totalwig(districtModel.district);
    });
  }

  _totalwig(districts) {
    return SingleChildScrollView(
      child: Column(children: [
        ...(districts).map(
          (answer) {
            return answer['district_id'] == 1000
                ? Text('Select_Text')
                : ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(24),
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width, 60))),
                    child: Text(
                      answer['district_name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => print(answer['district_id'].toString()),
                  );
          },
        ).toList(),
      ]),
    );
  }

  // _createwig(districts) {
  //   List<Widget> columnContent = [];
  //   for (dynamic dis in districts) {
  //     columnContent.add(
  //       ListTile(
  //         title: dis['district_id']==1000?Text('Select State'):ElevatedButton(
  //           onPressed: ()=>print(dis['district_id']),
  //           child: Text(
  //             dis['district_name'],
  //             style: TextStyle(fontSize: 18.0),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   return columnContent;
  // }
}
