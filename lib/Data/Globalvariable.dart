library project.globals;

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

bool isExpanded = false;
List<dynamic> states;
int noofstates;

class DistrictModel extends ChangeNotifier {
  List<dynamic> district = [];

  void fetchdistricts({
    String url = 'https://cdn-api.co-vin.in/api/v2/admin/location/districts/',
    String stateid,
  }) async {
    if (stateid == '100')
      district = [
        {"district_id": 1000, "district_name": "Select District"}
      ];
    else {
      url += stateid;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        district = jsonDecode(response.body)['districts'];
      } else {
        print('not found');
        // return ('Failed to load');
        throw Exception('Failed to load');
      }
    }
    notifyListeners();
  }
}

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
