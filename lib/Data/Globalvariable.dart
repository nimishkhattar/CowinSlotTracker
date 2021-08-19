library project.globals;
import 'package:flutter/foundation.dart';
int noofstates = 0;
bool isExpanded = false;
var states = [
  "Select state",
];
List<String> districts = [
  "Test1",
  "Test2",
];
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
