library project.globals;

import 'package:flutter/foundation.dart';

bool isExpanded = false;
List<dynamic> states;
List<String> districts = [];
int noofstates;
// class PinModel extends ChangeNotifier {
//   final List<String> pincode = [];
//   void add(pin) {
//     pincode.add(pin);
//     notifyListeners();
//   }

//   void removeAt(index) {
//     pincode.removeAt(index);
//     notifyListeners();
//   }
// }
class PinModel extends ChangeNotifier {
  final List<String> pincode = [];
  void add(pin) {
    pincode.add(pin);
    notifyListeners();
  }

  void removeAt(index) {
    pincode.removeAt(index);
    notifyListeners();
  }
}

PinModel pincode = new PinModel();
