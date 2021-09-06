library project.globals;

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

List<dynamic> reslt = [];
bool isExpanded = false;
List<dynamic> states;
int noofstates;
List<String> listedpin = [];
List<int> listeddistricts = [];
Map<int, bool> selecteddistricts = {};
ValueNotifier<List<dynamic>> districtadded = ValueNotifier([]);

ValueNotifier<List<dynamic>> pinadded = ValueNotifier([]);

class DistrictModel extends ChangeNotifier {
  List<dynamic> district = [];

  void fetchdistricts({
    String url = 'https://cdn-api.co-vin.in/api/v2/admin/location/districts/',
    String stateid,
  }) async {
    if (stateid == '1000')
      district = [
        {"district_id": 1000, "district_name": "Select State"}
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
    listedpin.add(pin);
    notifyListeners();
  }

  void removeAt(index) {
    pincode.removeAt(index);
    listedpin.removeAt(index);
    notifyListeners();
  }
}

PinModel pincode = new PinModel();
List<bool> expanded = [];
const data = [
  {
    "center_id": 780267,
    "name": "SKV Baba Ramdev.Karol Bagh2",
    "address": "Karol Bagh",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "97579f57-02fd-4ff9-8d46-5fd28e00dd8d",
        "date": "01-09-2021",
        "available_capacity": 14,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 3,
        "available_capacity_dose2": 11
      },
      {
        "session_id": "87a8ecbe-fbad-4829-a62c-05b9119b03d9",
        "date": "02-09-2021",
        "available_capacity": 85,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 22
      },
      {
        "session_id": "2fcff931-1ca4-427d-a20a-6f5ffcaf0bee",
        "date": "03-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 26
      }
    ]
  },
  {
    "center_id": 694886,
    "name": "NIGAM PRATIBHA V KAMLA NAGAR 2",
    "address": "E - Block Kamla Nagar Double Storey (Ward No. 78)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "516fff78-c345-425d-8572-54774a6f46b6",
        "date": "01-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 62,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "a0600d45-1a52-46e6-88d1-d1689fdf42a3",
        "date": "02-09-2021",
        "available_capacity": 91,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "58786dc4-c389-43b1-a9c9-cd9668795735",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 663057,
    "name": "Hindu Rao Hosl DH SITE 3",
    "address": "HINDU RAO HOSPITAL MALKA GANJ",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "5f1b1c9d-30a7-45c5-b137-c55d96414977",
        "date": "01-09-2021",
        "available_capacity": 85,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 56,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "253d6cb0-181c-46ed-a996-f5f53774d1db",
        "date": "02-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "a72425ca-c050-4728-bbe3-0392adad959a",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 658585,
    "name": "Balak Ram Hospital SITE 5",
    "address": "BALAK RAM HOSPITAL TIMAR PUR DELHI 110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "cceb5e28-e120-488b-8c57-98a9a885d2f9",
        "date": "01-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "1cfcc0da-b827-4a44-b25b-9975020fd1b6",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "d5f56168-b05a-42cf-b461-b948354e8a56",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 560724,
    "name": "Sir Ganga Ram Hospital SITE 1",
    "address": "Sir Ganga Ram Hospital Old Rajinder Nagar New Delhi 110060",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "7ab7d97d-b15f-48c4-96ac-d987c7c4be0c",
        "date": "01-09-2021",
        "available_capacity": 267,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 139,
        "available_capacity_dose2": 128
      },
      {
        "session_id": "16f0c7d9-2527-4725-a309-ba05e0b5d36f",
        "date": "03-09-2021",
        "available_capacity": 277,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 145,
        "available_capacity_dose2": 132
      },
      {
        "session_id": "832e6d18-b2a5-442c-ae0c-37a962df9d4e",
        "date": "04-09-2021",
        "available_capacity": 278,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 145,
        "available_capacity_dose2": 133
      },
      {
        "session_id": "950a80ca-77d7-4d26-b925-ac4d0c5e180e",
        "date": "05-09-2021",
        "available_capacity": 275,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 148,
        "available_capacity_dose2": 127
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 708052,
    "name": "MCD SCHOOL ARUNA NAGAR",
    "address": "ARUNA NAGAR MAJNU KA TILA",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "5bcbffc9-e3c1-4d6c-a205-ace7e80a016f",
        "date": "01-09-2021",
        "available_capacity": 91,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 65,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "5e9edf54-4801-438a-bcaa-d56da18f73d4",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "f9326bef-0f2d-489a-99ea-f08fed20274b",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 560739,
    "name": "Burari Hospital Site 3",
    "address": "Kaushik Enclave Shankarpura Burari",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "373b7b49-7dbe-4cce-9d13-e0feaf7c1acb",
        "date": "01-09-2021",
        "available_capacity": 9,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 9
      },
      {
        "session_id": "00932078-f3dc-4f54-88ed-b9a921d16b6e",
        "date": "02-09-2021",
        "available_capacity": 70,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 43,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "0ceaf93c-8dfd-4340-b537-a9c3b1cfde43",
        "date": "03-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 747948,
    "name": "Vidhya Bhawan School R Nagar 1",
    "address": "Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "74976ac3-5462-47b4-97b2-fbdafb173ec5",
        "date": "01-09-2021",
        "available_capacity": 50,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 38,
        "available_capacity_dose2": 12
      },
      {
        "session_id": "6add2524-5373-415d-9a61-86bddce268dd",
        "date": "02-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "b013ee7d-a6f0-4342-b63e-d404bac64141",
        "date": "03-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 693772,
    "name": "SBV JAMA MASJID HINDI SITE 4",
    "address": "Jama Masjid (Hindi Medium)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "bceffd1b-7150-4d98-897e-51086cd435f8",
        "date": "01-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "78efdd80-6db7-420f-9c36-daeec559888c",
        "date": "02-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "e7178e76-aa24-4afa-a8a6-bfbae2fe7cdc",
        "date": "03-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 23
      }
    ]
  },
  {
    "center_id": 702672,
    "name": "SKV Nehru Vihar",
    "address": "DGD Majnu Ka Tilla",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "b16a6a57-9490-4a5f-83a3-d513cd2071d3",
        "date": "01-09-2021",
        "available_capacity": 58,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 33,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "5aa3b25f-8b1a-4128-9545-8efd5b25ca06",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "2e8a6da9-2292-45a3-b5de-f7e563081847",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 693752,
    "name": "Sarvodhya V Mori G NO.1 SITE 3",
    "address": "Mori Gate No.1",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "4d427896-76cb-487d-ac33-22b15878e9bb",
        "date": "01-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "c006d50c-7ee7-473e-8dbc-287a0f5a34ff",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "6be71312-5d3e-4b3d-acda-59c5bd0a844c",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 666966,
    "name": "LNJP Hospital DH Site 5",
    "address": "JLNMarg New Delhi-",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "18b0f8e3-44b9-4932-b5f7-3d809ddd860a",
        "date": "01-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "ab1f51cd-2b75-41a0-b622-699bf06889c6",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "481bcded-6f90-4d7d-acda-d884d5914944",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 606543,
    "name": "BURARI HOSPTIAL SITE 4",
    "address": "Kaoushik Enclave Shankar Pura Burari",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "b7d596c4-9e61-4e03-8829-75f3fcfda12c",
        "date": "01-09-2021",
        "available_capacity": 10,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 10
      },
      {
        "session_id": "ffd0920e-b214-4710-a5f1-67fb108dadc1",
        "date": "02-09-2021",
        "available_capacity": 84,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 56,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "e5b6a9af-d21d-4c39-ad79-d3254842062e",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 560733,
    "name": "Sir Ganga Ram Hospital Site 2",
    "address": "Sir Ganga Ram Hospital Old Rajinder Nagar New Delhi 110060",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "053ac364-82e6-4086-9a0c-c6ddb598023f",
        "date": "01-09-2021",
        "available_capacity": 263,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 133,
        "available_capacity_dose2": 130
      },
      {
        "session_id": "1872412a-d606-443f-b3d8-56a1e5c43019",
        "date": "03-09-2021",
        "available_capacity": 282,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 145,
        "available_capacity_dose2": 137
      },
      {
        "session_id": "858a1f78-502b-4aa4-8168-6e4de2f3df33",
        "date": "04-09-2021",
        "available_capacity": 260,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 140,
        "available_capacity_dose2": 120
      },
      {
        "session_id": "2c6872cd-bb14-4b46-9f58-8b0a0da6a292",
        "date": "05-09-2021",
        "available_capacity": 285,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 147,
        "available_capacity_dose2": 138
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVAXIN", "fee": "1250"}
    ]
  },
  {
    "center_id": 747953,
    "name": "Vidhya Bhawan School R Nagar 4",
    "address": "Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "28e39496-433e-4ad8-b26c-3830048ca106",
        "date": "01-09-2021",
        "available_capacity": 65,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 39,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "c72d3c69-9dfb-4787-acec-d792f9813beb",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "66060082-e12a-4318-a9eb-15cb4939c89c",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 807057,
    "name": "Rajdhani Charitable Eye M",
    "address": "6550 BABU RAM SOLANKI MARG NABI KARIM",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110055,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "15:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "31f14b60-eeb5-4058-8aa7-118925d79097",
        "date": "01-09-2021",
        "available_capacity": 0,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      }
    ]
  },
  {
    "center_id": 747954,
    "name": "Vidhya Bhawan School R Nagar 5",
    "address": "Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "48f0d54e-cae2-4613-8810-5ec37cbea427",
        "date": "01-09-2021",
        "available_capacity": 69,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 43,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "fcbee9c0-4897-473d-8719-fa76c7aa2b81",
        "date": "02-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 21
      },
      {
        "session_id": "d17492c8-4290-4171-a976-0dc0bdf2d13d",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 609992,
    "name": "S.S.V Burari Polyclinic",
    "address": "S.S.V Burari Polyclinic",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "e2cca57e-c272-4ad2-a5e6-7f70b6050798",
        "date": "01-09-2021",
        "available_capacity": 6,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 6
      },
      {
        "session_id": "bc41f002-878f-40d6-be55-4fcf3e37f781",
        "date": "02-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 58,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "94d059ab-d5d9-4c34-8006-74c90c660e2a",
        "date": "03-09-2021",
        "available_capacity": 91,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 65,
        "available_capacity_dose2": 26
      }
    ]
  },
  {
    "center_id": 702710,
    "name": "SalwanSr Sec Sch. Old Rajinder",
    "address": "Old Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "9b52b34d-dc07-4033-a0f1-a91b951ce5ba",
        "date": "01-09-2021",
        "available_capacity": 41,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 24,
        "available_capacity_dose2": 17
      },
      {
        "session_id": "d88ea1d4-0fb7-4e29-95dd-b988a9e02ba9",
        "date": "02-09-2021",
        "available_capacity": 82,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 58,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "93984e59-fd18-4a1a-a97e-fdd91e06f85c",
        "date": "03-09-2021",
        "available_capacity": 85,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 57,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 645199,
    "name": "Balak Ram Hospital SITE 2",
    "address": "BALAK RAM HOSPITAL TIMAR PUR DELHI 110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "cfe4bc65-3fec-4db7-8623-12ce7a3753e7",
        "date": "01-09-2021",
        "available_capacity": 82,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 53,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "f4c7fa2d-35bb-4cb1-ac19-c50c763ee8df",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "4fa38633-cef7-44d9-9ad7-a3de1a95e217",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 693768,
    "name": "SBV JAMA MASJID URDU SITE 3",
    "address": "Jama Masjid (Urdu Medium)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "2f715d3f-6dcb-4f44-afce-4c719c8db8e4",
        "date": "01-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 59,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "0fcd2d33-dee1-4331-b28f-7699e09644ce",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "01bccd78-a62d-45a2-95ad-a223321cde8e",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 723487,
    "name": "GBSSS Ramjas Lane Karol Bagh4",
    "address": "Karol Bagh",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "683c4b7f-6465-4bf3-badc-7fae81c9a584",
        "date": "01-09-2021",
        "available_capacity": 20,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 8,
        "available_capacity_dose2": 12
      },
      {
        "session_id": "c763a6c2-f8e4-4ea9-89c1-ea21d7cc3ebb",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "9936a902-e5a5-434f-b17a-ed4bb9f0416f",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 736003,
    "name": "BLK MAX (Kalra Hospital SRCN)",
    "address": "Kalra Hospital SRCN Pvt Ltd. A-6 Moti Nagar New Delhi-110015",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 77,
    "long": 28,
    "from": "09:00:00",
    "to": "15:30:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "1340b5f0-3dc6-4383-85d9-b19e687e300f",
        "date": "01-09-2021",
        "available_capacity": 191,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 94,
        "available_capacity_dose2": 97
      },
      {
        "session_id": "465916c1-82a6-48f7-96d0-94acb91ac613",
        "date": "02-09-2021",
        "available_capacity": 196,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 96,
        "available_capacity_dose2": 100
      },
      {
        "session_id": "d114c526-9327-4755-bf56-a985dc6f1b24",
        "date": "03-09-2021",
        "available_capacity": 199,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 99
      },
      {
        "session_id": "5a2b928d-b34e-4aa2-9e48-9239eae75628",
        "date": "04-09-2021",
        "available_capacity": 198,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 98
      },
      {
        "session_id": "b609b1e0-fbc7-409e-829d-3f9e8f52f535",
        "date": "05-09-2021",
        "available_capacity": 197,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 97
      },
      {
        "session_id": "7cb2d5c9-f97f-4054-9631-ab96de5539b7",
        "date": "06-09-2021",
        "available_capacity": 200,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 100
      },
      {
        "session_id": "b265f2ac-b271-494c-9e97-d31e9ca9d4e0",
        "date": "07-09-2021",
        "available_capacity": 200,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 100
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 560729,
    "name": "SGR Kolmet Hospital",
    "address": "Sir Ganga Ram Hospital Old Rajinder Nagar New Delhi 110060",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "5900fdd7-28e9-4b01-9d98-5540eb8ba764",
        "date": "01-09-2021",
        "available_capacity": 91,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 42,
        "available_capacity_dose2": 49
      },
      {
        "session_id": "9ea887e1-5e17-4f09-9194-322989fcc865",
        "date": "02-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 45,
        "available_capacity_dose2": 45
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 580638,
    "name": "ARUNA ASAF HOSPITAL SITE 2",
    "address": "5-Rajpur Road Delhi-110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "ae67364c-6ac9-4282-8955-6156826e3e92",
        "date": "01-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "21776cac-4ef4-477d-98fb-5d9ba28ce57b",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "42961270-acc0-4a93-b9f3-d0f212c7bd42",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 711073,
    "name": "GGSS DEPUTY GANJ",
    "address": "DEPUTY GANJ",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "f6e8788a-4159-44e1-82bd-1335b91cf7c2",
        "date": "01-09-2021",
        "available_capacity": 41,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 16,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "d95386dc-8dbe-44ec-95cd-e504796e4015",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "3a45697f-b76b-4904-a749-59092bce9dbe",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 708308,
    "name": "GBSSS KAMLA MARKET",
    "address": "KAMLA MARKET",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110002,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "0fd8fdb6-5947-4756-95fd-c76734bdbcfb",
        "date": "01-09-2021",
        "available_capacity": 33,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 25,
        "available_capacity_dose2": 8
      }
    ]
  },
  {
    "center_id": 830942,
    "name": "Hindustan Wellness At SH",
    "address":
        "Sabharwal Hospital 911B Sir Syed Ahmed Rd Behind Golcha Cinema Kucha Chalan Khabas Pura Daryaganj",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110002,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "18:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "14a6286c-2543-48fe-97c4-85e98d0d228b",
        "date": "01-09-2021",
        "available_capacity": 392,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 196,
        "available_capacity_dose2": 196
      },
      {
        "session_id": "6283f518-19d0-4162-9bc1-8a78d41342bc",
        "date": "02-09-2021",
        "available_capacity": 392,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 197,
        "available_capacity_dose2": 195
      },
      {
        "session_id": "ebb336e1-704e-4d6d-9d0e-9373c927451a",
        "date": "03-09-2021",
        "available_capacity": 397,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 199,
        "available_capacity_dose2": 198
      },
      {
        "session_id": "cff0e730-0840-4038-82c8-7aad74373c78",
        "date": "04-09-2021",
        "available_capacity": 395,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 199,
        "available_capacity_dose2": 196
      },
      {
        "session_id": "16ae0a40-82be-4fee-8b23-d4bbea0eb4d5",
        "date": "05-09-2021",
        "available_capacity": 400,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 200,
        "available_capacity_dose2": 200
      },
      {
        "session_id": "ae5885e9-4449-4747-9b74-b9d352ff00d4",
        "date": "06-09-2021",
        "available_capacity": 400,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 200,
        "available_capacity_dose2": 200
      },
      {
        "session_id": "c68f6247-54ff-4304-9e05-20561d3f545b",
        "date": "07-09-2021",
        "available_capacity": 398,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 200,
        "available_capacity_dose2": 198
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 747614,
    "name": "NEW DELHI MEDICAL CENTRE",
    "address": "1st Floor Hemkunt Tower Rajendra Place New Delhi",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110008,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "18:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "bedaf724-685d-4c11-9bb3-2423a243a96c",
        "date": "01-09-2021",
        "available_capacity": 696,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 296,
        "available_capacity_dose2": 400
      },
      {
        "session_id": "202737d8-d1d2-487e-9fa8-fa5798c92e79",
        "date": "01-09-2021",
        "available_capacity": 662,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 272,
        "available_capacity_dose2": 390
      },
      {
        "session_id": "2a3783a1-56c7-484b-a39e-d236e4293ba6",
        "date": "02-09-2021",
        "available_capacity": 694,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 294,
        "available_capacity_dose2": 400
      },
      {
        "session_id": "0a2c3dc9-7631-4dd7-ac28-4535e301b881",
        "date": "02-09-2021",
        "available_capacity": 678,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 287,
        "available_capacity_dose2": 391
      },
      {
        "session_id": "1814a6ce-bdef-416c-8964-ec4a743663e2",
        "date": "03-09-2021",
        "available_capacity": 676,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 290,
        "available_capacity_dose2": 386
      },
      {
        "session_id": "8ffbc945-e5ff-454a-aa63-6f2a9df10dfd",
        "date": "03-09-2021",
        "available_capacity": 694,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 297,
        "available_capacity_dose2": 397
      },
      {
        "session_id": "ffdccdc4-18dd-4852-94a5-f0daff5c2605",
        "date": "04-09-2021",
        "available_capacity": 673,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 283,
        "available_capacity_dose2": 390
      },
      {
        "session_id": "e35877c0-4a1f-4e70-ac17-c3ec2622f46f",
        "date": "04-09-2021",
        "available_capacity": 697,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 299,
        "available_capacity_dose2": 398
      },
      {
        "session_id": "ea185f29-0d12-42b9-8fe4-90198330e4de",
        "date": "05-09-2021",
        "available_capacity": 695,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 297,
        "available_capacity_dose2": 398
      },
      {
        "session_id": "4088c1e2-025e-4803-9594-8726d0c59519",
        "date": "05-09-2021",
        "available_capacity": 673,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 288,
        "available_capacity_dose2": 385
      },
      {
        "session_id": "4ee33017-9173-47fd-970f-31a698a16425",
        "date": "06-09-2021",
        "available_capacity": 699,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 299,
        "available_capacity_dose2": 400
      },
      {
        "session_id": "d6f4a872-aec5-459a-a3c5-c93299ef45a0",
        "date": "06-09-2021",
        "available_capacity": 688,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 295,
        "available_capacity_dose2": 393
      },
      {
        "session_id": "372cb284-9671-4bea-9c0c-c827a56d525e",
        "date": "07-09-2021",
        "available_capacity": 690,
        "min_age_limit": 18,
        "max_age_limit": 44,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 297,
        "available_capacity_dose2": 393
      },
      {
        "session_id": "58860823-bf01-4cf7-9733-32c0266f7fad",
        "date": "07-09-2021",
        "available_capacity": 700,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 300,
        "available_capacity_dose2": 400
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 580267,
    "name": "JEEWAN MALA HOSPITAL SITE 1",
    "address": "67-1 NEW ROHTAK ROAD NEW DELHI 110005",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "10:30:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "346d2cdd-46ba-4507-bda3-232208120ff3",
        "date": "01-09-2021",
        "available_capacity": 64,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "10:30AM-11:30AM",
          "11:30AM-12:30PM",
          "12:30PM-01:30PM",
          "01:30PM-04:00PM"
        ],
        "available_capacity_dose1": 32,
        "available_capacity_dose2": 32
      },
      {
        "session_id": "78885abe-daad-4b23-a3db-db17bb20194e",
        "date": "02-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "10:30AM-11:30AM",
          "11:30AM-12:30PM",
          "12:30PM-01:30PM",
          "01:30PM-04:00PM"
        ],
        "available_capacity_dose1": 45,
        "available_capacity_dose2": 43
      },
      {
        "session_id": "f0ec4f04-d07d-4538-b784-db3ebe41dce9",
        "date": "03-09-2021",
        "available_capacity": 85,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "10:30AM-11:30AM",
          "11:30AM-12:30PM",
          "12:30PM-01:30PM",
          "01:30PM-04:00PM"
        ],
        "available_capacity_dose1": 39,
        "available_capacity_dose2": 46
      },
      {
        "session_id": "66723336-14d8-497e-a2f9-74e92d9fbb8f",
        "date": "04-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "11:30AM-12:30PM",
          "12:30PM-01:30PM",
          "01:30PM-02:30PM",
          "02:30PM-04:00PM"
        ],
        "available_capacity_dose1": 47,
        "available_capacity_dose2": 42
      },
      {
        "session_id": "149d371c-f617-4942-8032-0f8bce7ff605",
        "date": "06-09-2021",
        "available_capacity": 81,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "10:30AM-11:30AM",
          "11:30AM-12:30PM",
          "12:30PM-01:30PM",
          "01:30PM-04:00PM"
        ],
        "available_capacity_dose1": 35,
        "available_capacity_dose2": 46
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 560697,
    "name": "LNJP Hospital Site 3",
    "address": "JLNMarg New Delhi-",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "2a247c89-c9ab-4e95-89f1-a980d5152b58",
        "date": "01-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "721f81f9-fd0e-4436-9776-926c182751b2",
        "date": "02-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "f9e6f667-d7da-4c1e-a400-a7cee44f6cd1",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 580265,
    "name": "Guru Nanak Eye SITE 1",
    "address":
        "Garu Nanak Eye Hospital Maharaja Ranjeet Singh Marg New Delhi-2",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110002,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "a4fb4b04-70bc-41a0-9352-3d058d38661a",
        "date": "01-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "7147854f-5a25-4c38-9feb-65120cf4af0e",
        "date": "02-09-2021",
        "available_capacity": 91,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "ea2e9181-8e23-4f53-ae74-0af5a3b23b10",
        "date": "03-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 735998,
    "name": "BLK MAX (NKS Hospital)",
    "address": "NKS Super Specialty Hospital 219 220 Gulabi Bagh Delhi-11007",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 77,
    "long": 28,
    "from": "09:00:00",
    "to": "15:30:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "61814908-10ab-4bdc-a6cb-b7f3d9c5be74",
        "date": "01-09-2021",
        "available_capacity": 190,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 94,
        "available_capacity_dose2": 96
      },
      {
        "session_id": "cf92f067-301c-456d-8148-062ff5173213",
        "date": "02-09-2021",
        "available_capacity": 199,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 99
      },
      {
        "session_id": "974d078d-c296-4d65-b22e-02ecb97d0be1",
        "date": "03-09-2021",
        "available_capacity": 198,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 98,
        "available_capacity_dose2": 100
      },
      {
        "session_id": "14fba11d-3b29-4711-827a-5c3a0710e230",
        "date": "04-09-2021",
        "available_capacity": 195,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 97,
        "available_capacity_dose2": 98
      },
      {
        "session_id": "18b034c4-8cde-4b2c-a9d3-ab9055978417",
        "date": "05-09-2021",
        "available_capacity": 197,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 97
      },
      {
        "session_id": "3e267be4-26e7-4b72-a714-355d646a988d",
        "date": "06-09-2021",
        "available_capacity": 198,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 98
      },
      {
        "session_id": "5ebd1ce5-1da2-4371-812e-ffba522a49d9",
        "date": "07-09-2021",
        "available_capacity": 200,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:30PM"
        ],
        "available_capacity_dose1": 100,
        "available_capacity_dose2": 100
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 645205,
    "name": "Balak Ram Hospital SITE 3",
    "address": "BALAK RAM HOSPITAL TIMAR PUR DELHI 110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "99a0a00e-91ac-4764-a9ca-8bd8911367f5",
        "date": "01-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 59,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "b22402b1-fdd9-44ba-ad04-af1b9dd55d71",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "b6f81ed7-19a3-4eed-82d8-3266ae8cc6d1",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 708306,
    "name": "SKV NO.2 LAL KUAN ZEENAT MAHEL",
    "address": "LAL KUAN ZEENAT MAHEL",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "18431655-537c-4329-abcd-ef936dec8e96",
        "date": "01-09-2021",
        "available_capacity": 57,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 33,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "37d23a64-15f1-4642-980e-0172cb444d5a",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "be0384ee-124c-407b-8b8f-a42c20a9cb75",
        "date": "03-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 747951,
    "name": "Vidhya Bhawan School R Nagar 3",
    "address": "Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "aa10cfad-15c9-48b5-8fde-f8dd925b1475",
        "date": "01-09-2021",
        "available_capacity": 85,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 59,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "f67c21b1-1c3b-4311-8880-79f4de754c68",
        "date": "02-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "18d2c7cb-2887-4c46-86c7-08022cdc15eb",
        "date": "03-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 26
      }
    ]
  },
  {
    "center_id": 580275,
    "name": "MAMC SITE 2",
    "address": "MAMC Campus",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "74aef7c5-cfba-4874-9969-4ffa3fd36ce4",
        "date": "01-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 20
      }
    ]
  },
  {
    "center_id": 590323,
    "name": "Sanjeevan Hospital Daryaganj",
    "address": "Sanjeevan Hospital Daryaganj",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110002,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "17:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "c0389215-296e-4421-bee6-9d176f442710",
        "date": "01-09-2021",
        "available_capacity": 45,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 26,
        "available_capacity_dose2": 19
      },
      {
        "session_id": "de891183-ba79-4907-9a6a-9424b8ae163c",
        "date": "02-09-2021",
        "available_capacity": 50,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 30,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "235e4e90-48f5-4f22-ade3-dabe9fcb4222",
        "date": "03-09-2021",
        "available_capacity": 50,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 30,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "189f8a1d-ee58-47bf-b555-639649ece873",
        "date": "04-09-2021",
        "available_capacity": 47,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 29,
        "available_capacity_dose2": 18
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVAXIN", "fee": "1200"}
    ]
  },
  {
    "center_id": 694887,
    "name": "NIGAM PRATIBHA V KAMLA NAGAR 3",
    "address": "E - Block Kamla Nagar Double Storey (Ward No. 78)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "9a14095f-02ed-4243-84ef-0fa669a18552",
        "date": "01-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "495f318d-0787-45f9-a829-55e07adab693",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "744740ec-f99d-4be2-874c-9b0da24c63cc",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 723497,
    "name": "SKVNO.2 LAL KUAN ZEENAT MAHEL3",
    "address": "LAL KUAN ZEENAT MAHEL",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "b79b8c38-0ced-4780-a813-e7aecf7cc799",
        "date": "01-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "b8853970-a2a0-4f69-83a6-1563b51887e5",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "6b2f4c4e-50e2-446a-8bf3-1ad79fb17317",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 702703,
    "name": "Anglo Arabic SeniorAjmeri Gate",
    "address": "Ajmeri Gate",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "83bd56a2-c2e8-4cbb-8dfa-db22df58c3ad",
        "date": "01-09-2021",
        "available_capacity": 34,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 20,
        "available_capacity_dose2": 14
      },
      {
        "session_id": "8dd1ecc3-ae44-4677-be39-af9e7896d12d",
        "date": "02-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "2e313cf5-0302-4856-9aee-03c3a45d00be",
        "date": "03-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 24
      }
    ]
  },
  {
    "center_id": 693443,
    "name": "GSBV BURARI SITE 1",
    "address": "Burari Delhi - 110084 (School ID - 1207009)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "a24756df-17c0-44ef-9367-2e7acbdfcd25",
        "date": "01-09-2021",
        "available_capacity": 0,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "e650c955-68b3-4586-96bf-833a22b3ba16",
        "date": "02-09-2021",
        "available_capacity": 47,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 27,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "908b3505-f1d7-4dc9-b7d5-ddeea2040d2e",
        "date": "03-09-2021",
        "available_capacity": 12,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 7,
        "available_capacity_dose2": 5
      }
    ]
  },
  {
    "center_id": 4422,
    "name": "Dr. N.C. Joshi Hospital",
    "address": "Joshi Road Karol Bagh New Delhi-110005",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "d48318d6-8156-48f8-9074-ddc1d8f51348",
        "date": "01-09-2021",
        "available_capacity": 1,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 1
      },
      {
        "session_id": "941af289-4e47-4749-80da-9137cf6c4a82",
        "date": "02-09-2021",
        "available_capacity": 48,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 34,
        "available_capacity_dose2": 14
      },
      {
        "session_id": "52807e6b-ee13-43fd-8dcd-46122dd7a629",
        "date": "03-09-2021",
        "available_capacity": 72,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 52,
        "available_capacity_dose2": 20
      }
    ]
  },
  {
    "center_id": 780272,
    "name": "SalwanSr Sec Sch Old Rajinder2",
    "address": "Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "154194ea-911e-4b6f-b027-2766222b8747",
        "date": "01-09-2021",
        "available_capacity": 41,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 25,
        "available_capacity_dose2": 16
      },
      {
        "session_id": "46b341a2-b17f-421f-9421-53b0e8a7e684",
        "date": "02-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 60,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "0b70c300-d87b-4e73-ba74-3547a91e0bff",
        "date": "03-09-2021",
        "available_capacity": 84,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 59,
        "available_capacity_dose2": 25
      }
    ]
  },
  {
    "center_id": 723475,
    "name": "SKV Nehru Vihar Site 2",
    "address": "SKV Nehru Vihar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "6876c90c-5739-4858-8dc2-4a842da334bb",
        "date": "01-09-2021",
        "available_capacity": 66,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 46,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "c85c26f8-3847-4805-8356-dee7e904cc8f",
        "date": "02-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "d8442734-6012-48f4-ba79-08ccfa50c464",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 693754,
    "name": "Sarvodhya V Mori G NO.1 SITE 4",
    "address": "Mori Gate No.1",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "436b5574-4fba-44da-8562-716943e07525",
        "date": "01-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "c60cc79c-0bc5-4ea0-bba0-26fdf3e5f3ee",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "55a7e248-a404-4f1d-bc89-f7ae67fb758e",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 666969,
    "name": "LNJP Hospital DH Site 6",
    "address": "JLNMarg New Delhi-",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "6e8a3b0c-26ef-44dc-b7e1-c575cb60caaa",
        "date": "01-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "2b0a9bb4-fcbd-4c7b-8f4f-178c41b509ff",
        "date": "02-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "cb8b7470-f0a6-45fa-9036-0feb37221a53",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 693451,
    "name": "SBV Rani Jhansi Road SITE 1",
    "address": "Rani Jhansi Road Near Aam Aadmi Mohalla Clinic",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110055,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "981fdbbf-34b4-4222-9551-23bab7a08450",
        "date": "01-09-2021",
        "available_capacity": 11,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 11
      },
      {
        "session_id": "18a74209-3784-45ee-aaba-c138a1a84d0c",
        "date": "02-09-2021",
        "available_capacity": 52,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 33,
        "available_capacity_dose2": 19
      },
      {
        "session_id": "07b95282-65a4-4cdd-8c6c-cb602c7cfbce",
        "date": "03-09-2021",
        "available_capacity": 80,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 58,
        "available_capacity_dose2": 22
      }
    ]
  },
  {
    "center_id": 702706,
    "name": "SKV Baba Ramdev Sch.Karol Bagh",
    "address": "Karol Bagh",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "2ec1aceb-d628-45bb-866a-fd74bb0291c7",
        "date": "01-09-2021",
        "available_capacity": 16,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 16
      },
      {
        "session_id": "516cfb0e-0db6-4647-849f-3f559585a88f",
        "date": "02-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "8ae9d832-b0cd-48e4-abc3-e2ae76931073",
        "date": "03-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 22
      }
    ]
  },
  {
    "center_id": 3,
    "name": "Aruna Asaf Ali Hospital DH",
    "address": "5-Rajpur Road Delhi-110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "d267b40c-1794-468d-b7e9-458205a8a561",
        "date": "01-09-2021",
        "available_capacity": 44,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 22,
        "available_capacity_dose2": 22
      },
      {
        "session_id": "06722d6b-9b2c-4db0-a62a-b02d0851473c",
        "date": "02-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "e0d931e4-9bd4-4bec-963a-9b4658f3d21e",
        "date": "03-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 61,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 693750,
    "name": "Sarvodhya V Mori G NO.1 SITE 2",
    "address": "Mori Gate No.1",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "1f75f90f-7c44-40f8-8fe6-1bdd63425753",
        "date": "01-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "baafe232-98b1-4e0a-9429-610abd84897f",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "bb884781-a5b1-4ccb-a856-70453bde736a",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 723506,
    "name": "SBV Tulsi Nagar",
    "address": "SBV Tulsi Nagar Delhi-35",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110035,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "c32d5ee2-5372-48c2-8e71-b73c293406bd",
        "date": "01-09-2021",
        "available_capacity": 1,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 1
      },
      {
        "session_id": "84af2b91-f888-4d82-b32e-12ee74a7e1c4",
        "date": "02-09-2021",
        "available_capacity": 44,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 28,
        "available_capacity_dose2": 16
      },
      {
        "session_id": "e52efb73-3cbb-4be5-877d-e158b151d290",
        "date": "03-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 65,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 617019,
    "name": "Hindustan Wellness At ADH",
    "address": "24-9 SHAKTI NAGAR",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "18:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "5988e343-f976-4976-bfb2-e626729194e7",
        "date": "01-09-2021",
        "available_capacity": 376,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 191,
        "available_capacity_dose2": 185
      },
      {
        "session_id": "268c531f-9048-417d-bfbc-21890a440865",
        "date": "02-09-2021",
        "available_capacity": 386,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 196,
        "available_capacity_dose2": 190
      },
      {
        "session_id": "3b3ddaa0-c3aa-4d8b-bb29-2e574526ab8c",
        "date": "03-09-2021",
        "available_capacity": 388,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 196,
        "available_capacity_dose2": 192
      },
      {
        "session_id": "966c748a-7662-4065-afc2-6f5f5e01f1b1",
        "date": "04-09-2021",
        "available_capacity": 382,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 197,
        "available_capacity_dose2": 185
      },
      {
        "session_id": "77c88fe3-312f-49c6-afe6-bc36911bdfac",
        "date": "05-09-2021",
        "available_capacity": 386,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 198,
        "available_capacity_dose2": 188
      },
      {
        "session_id": "071f3d35-1be2-4c69-a923-9154dc77a5e5",
        "date": "06-09-2021",
        "available_capacity": 393,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 197,
        "available_capacity_dose2": 196
      },
      {
        "session_id": "8a87027d-8439-43c8-bb7a-811d14479587",
        "date": "07-09-2021",
        "available_capacity": 398,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-06:00PM"
        ],
        "available_capacity_dose1": 200,
        "available_capacity_dose2": 198
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 693434,
    "name": "NIGAM PRATIBHA V KAMLA NAGAR 1",
    "address": "E - Block Kamla Nagar Double Storey (Ward No. 78)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "95c39b80-b174-430a-94f6-9b4a31c07e07",
        "date": "01-09-2021",
        "available_capacity": 91,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 65,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "19ce0d0b-b362-4d55-82a2-af5cc77a9f83",
        "date": "02-09-2021",
        "available_capacity": 81,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 60,
        "available_capacity_dose2": 21
      },
      {
        "session_id": "0ceb2abd-4445-4751-ab90-5dd6c7c30bbe",
        "date": "03-09-2021",
        "available_capacity": 87,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 21
      }
    ]
  },
  {
    "center_id": 606553,
    "name": "BURARI HOSPTIAL SITE 5",
    "address": "Kaoushik Enclave Shankar Pura Burari",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "9d10ee5c-596e-44c5-a222-019322836c1e",
        "date": "01-09-2021",
        "available_capacity": 20,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "58753fba-3310-4c22-b227-406e9bec22b2",
        "date": "02-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 56,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "ffec0c2a-b9e9-4bf7-bbdd-1e46c6f0f571",
        "date": "03-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 728504,
    "name": "Apollo Specialty Hospital",
    "address": "New Rohtak Road Karol Bagh New Delhi",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "14:00:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "4f80f7f1-0cbc-4efe-b59f-72daa28d8f80",
        "date": "01-09-2021",
        "available_capacity": 67,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["02:00PM-04:00PM"],
        "available_capacity_dose1": 42,
        "available_capacity_dose2": 25
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVAXIN", "fee": "1410"}
    ]
  },
  {
    "center_id": 711089,
    "name": "SKV SHASTRI NAGAR",
    "address": "SHASTRI NAGAR",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110035,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "9fcf034c-c0e2-4d61-a328-e7369015ab34",
        "date": "01-09-2021",
        "available_capacity": 17,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 17
      },
      {
        "session_id": "b34b2e50-d3b8-432a-a1f1-d6287778f256",
        "date": "02-09-2021",
        "available_capacity": 68,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 46,
        "available_capacity_dose2": 22
      },
      {
        "session_id": "9ec97044-8263-49a5-b153-40a2df238832",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 706624,
    "name": "Aruna Asaf Ali Hospital Site 3",
    "address": "5-Rajpur Road Delhi-110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "5ae50146-9062-439c-9bd2-07d8ab53dbb6",
        "date": "01-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 63,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 580260,
    "name": "MAIDS SITE 1",
    "address": "MAIDS",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "3fc6e06e-888f-47ae-8bec-e19f261c71c6",
        "date": "01-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "9cdb346c-b8a9-4434-b284-7523a97b6562",
        "date": "02-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "02390a53-438e-415a-9ce8-06be112dd3c4",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 580269,
    "name": "Kasturba Hospital DH SITE 1",
    "address": "Kasturba Hospital Jama Masjid Darya Ganj Delhi-110006",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "45ee1769-e0f0-44f3-a39c-1c7e75f379ba",
        "date": "01-09-2021",
        "available_capacity": 63,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 49,
        "available_capacity_dose2": 14
      },
      {
        "session_id": "254901e9-002c-4668-9a7c-b66e3bdcd042",
        "date": "02-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "c2936df5-72d8-4e93-8cb1-e6ae6fc1d4dd",
        "date": "03-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 723494,
    "name": "SKVNO.2 LAL KUAN ZEENAT MAHEL2",
    "address": "LAL KUAN ZEENAT MAHEL",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "38312d24-aa88-498f-9c9d-bd6de97e372b",
        "date": "01-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "26966f8c-2fd3-442f-a86c-4ee47d346c47",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "5894f9eb-fbfa-460c-a049-75c2c245ba97",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 580271,
    "name": "Hindu Rao Hospital DH SITE 1",
    "address": "HINDU RAO HOSPITAL MALKA GANJ",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "d1ae95a9-d390-4560-9548-f7806a02a15b",
        "date": "01-09-2021",
        "available_capacity": 80,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 52,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "c1273ee5-7ab0-431c-8258-ba5dbfbf6229",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "cfc5cac5-de0d-44ce-a9ce-bfadff3a1c00",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 560706,
    "name": "TIRATH RAM HOS Site 1",
    "address": "2A R.B.L Isher Das Sawhney Marg Rajpiu Road Delhi 110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "17:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "c1fe853a-e9bb-499d-94ee-e9b0a5cadd00",
        "date": "01-09-2021",
        "available_capacity": 177,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 86,
        "available_capacity_dose2": 91
      },
      {
        "session_id": "bcbd2dd9-7895-44a0-8450-be0ee3bd6cfc",
        "date": "01-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "447b1fb5-7b6e-42fe-9f43-95a81511419b",
        "date": "02-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "f6bd5443-7365-43c8-b711-198da15a3eda",
        "date": "02-09-2021",
        "available_capacity": 188,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 96,
        "available_capacity_dose2": 92
      },
      {
        "session_id": "ad5b81aa-f62d-48cd-9ac2-5100fd3f1c0d",
        "date": "03-09-2021",
        "available_capacity": 189,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 97,
        "available_capacity_dose2": 92
      },
      {
        "session_id": "2fa6e8de-390c-4b27-9b33-2b15d76584a1",
        "date": "03-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "7dd95054-390b-4b87-9f39-e75e19a0e698",
        "date": "04-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "00e83892-ccad-4ec1-83d1-a7bdc68bb4e6",
        "date": "04-09-2021",
        "available_capacity": 186,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 96,
        "available_capacity_dose2": 90
      },
      {
        "session_id": "c3080fd2-83ca-4aa0-bd0a-8685c4696e60",
        "date": "05-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "05ea6cea-957b-4a04-bfd9-19196130b137",
        "date": "06-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "2ad5c5ca-6f70-4775-8e5c-06336dda5b2c",
        "date": "07-09-2021",
        "available_capacity": 0,
        "min_age_limit": 45,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-12:00PM",
          "12:00PM-03:00PM",
          "03:00PM-06:00PM",
          "06:00PM-09:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 723476,
    "name": "SKV Nehru Vihar Site 3",
    "address": "Majnu Ka Tilla",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "6e8e0cca-da0b-479b-a433-fbbfccdac2ab",
        "date": "01-09-2021",
        "available_capacity": 72,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 43,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "683bba54-5852-480f-920a-d6593a520286",
        "date": "02-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "9faa022a-854f-41ae-808b-17835e0ba5c4",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 610008,
    "name": "Vivekanand Polyclinic",
    "address": "Vivekanand Polyclini",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "cff4a5b7-f2b4-4e5b-9ae8-829c941a5f16",
        "date": "01-09-2021",
        "available_capacity": 9,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 9
      },
      {
        "session_id": "1e1f6233-8a39-4f8d-a267-3a8c0612db63",
        "date": "02-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "b8cf11e9-9ec8-4890-83ee-e5ad17db1d73",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 560735,
    "name": "Burari Hospital Session Site 1",
    "address": "Kaushik Enclave Shankarpura Burari",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "bf11e4fa-75c1-43b5-8a4a-1ac591557655",
        "date": "01-09-2021",
        "available_capacity": 0,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 0
      },
      {
        "session_id": "60464cfc-8226-45ab-97b3-a56e10dfd5ad",
        "date": "02-09-2021",
        "available_capacity": 1,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 1
      },
      {
        "session_id": "fa517b5d-fbc7-460e-ab0a-0ef72b4f253f",
        "date": "03-09-2021",
        "available_capacity": 38,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 18,
        "available_capacity_dose2": 20
      }
    ]
  },
  {
    "center_id": 693756,
    "name": "Sarvodhya V Mori G NO.1 SITE 5",
    "address": "Mori Gate No.1",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "b0ef918f-20b2-472e-9fc7-fff832e5e721",
        "date": "01-09-2021",
        "available_capacity": 101,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 31
      },
      {
        "session_id": "255435c2-c044-42b6-b043-05ddd71e107a",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "28a5196a-14f0-4b4e-93e8-0d931e028bf8",
        "date": "03-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 26
      }
    ]
  },
  {
    "center_id": 694889,
    "name": "NIGAM PRATIBHA V KAMLA NAGAR 4",
    "address": "E - Block Kamla Nagar Double Storey (Ward No. 78)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "1c0e1b51-5433-4512-af89-aac83aad5a3d",
        "date": "01-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "a64efae9-97fb-4255-ac00-fb43f98dc5bc",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "fdfcccb4-b62c-4377-88a5-54041deaab07",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 693774,
    "name": "SBV JAMA MASJID HINDI SITE 5",
    "address": "Jama Masjid (Hindi Medium)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "115a9d8d-18df-4f5b-9115-dc26f18f5244",
        "date": "01-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "11a134bb-0589-4741-8f5f-e8acad57c013",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "f401ff72-908b-46b6-bf18-f51c10ab3dd8",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 580266,
    "name": "DELHI HEART LUNG INS. SITE 1",
    "address": "3 MM II PANCHKUIAN ROAD NEW DELHI 110005",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110055,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "17:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "492f0b48-e613-4afc-af43-e97244396853",
        "date": "01-09-2021",
        "available_capacity": 66,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 30,
        "available_capacity_dose2": 36
      },
      {
        "session_id": "0ca33ede-c7fd-41bf-b16d-7a1ae63ce603",
        "date": "02-09-2021",
        "available_capacity": 77,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 38,
        "available_capacity_dose2": 39
      },
      {
        "session_id": "54624640-f7d9-46d2-9459-26f288bf57ba",
        "date": "03-09-2021",
        "available_capacity": 64,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 41,
        "available_capacity_dose2": 23
      },
      {
        "session_id": "643cf16f-7859-42f8-b4f8-69f0cae5f811",
        "date": "04-09-2021",
        "available_capacity": 69,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 36,
        "available_capacity_dose2": 33
      },
      {
        "session_id": "61027c24-7dd7-4942-b4a1-e4f31c81e927",
        "date": "06-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 45,
        "available_capacity_dose2": 41
      },
      {
        "session_id": "445a81b3-3a31-4cb8-8a0f-8a9644e56f3b",
        "date": "07-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:00PM"
        ],
        "available_capacity_dose1": 45,
        "available_capacity_dose2": 41
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVAXIN", "fee": "1410"}
    ]
  },
  {
    "center_id": 702691,
    "name": "SBVV Qutub Road Sadar Bazar",
    "address": "Qutub Road Sadar Bazar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "81f2ecc7-71e5-4fc1-8ffd-1adf34ff1b72",
        "date": "01-09-2021",
        "available_capacity": 64,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 35,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "19bc1683-73c9-4dbb-8ac6-7a9f2cf9296a",
        "date": "02-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "7ef53ac3-4e57-497a-9f42-a226bff28263",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 590377,
    "name": "Sir Ganga Ram Hospital Site 3",
    "address": "Sir Ganga Ram Hospital",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "9ca0ecf2-3da8-44fd-ad11-ebb4d2b1c9ef",
        "date": "01-09-2021",
        "available_capacity": 274,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 141,
        "available_capacity_dose2": 133
      },
      {
        "session_id": "fb8505e3-0c4b-4b00-b9bb-85d5e02af38e",
        "date": "03-09-2021",
        "available_capacity": 282,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 146,
        "available_capacity_dose2": 136
      },
      {
        "session_id": "131e2db1-4523-40f0-bdeb-6f19b1b54b8b",
        "date": "04-09-2021",
        "available_capacity": 272,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 146,
        "available_capacity_dose2": 126
      },
      {
        "session_id": "ae39bf63-252c-4e7f-bd61-8974b8dcc0ad",
        "date": "05-09-2021",
        "available_capacity": 287,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVAXIN",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 147,
        "available_capacity_dose2": 140
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVAXIN", "fee": "1250"}
    ]
  },
  {
    "center_id": 560694,
    "name": "LNJP Hospital Site 2",
    "address": "JLNMarg New Delhi-",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "a2aca6dd-e91c-498d-9d7f-ecb872061b29",
        "date": "01-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "bda3090b-f0d6-479d-8002-918be83bd1f4",
        "date": "02-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "1e57eef2-a120-4846-9dda-17a84fe981fb",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 8117,
    "name": "Northern Railway Hospital",
    "address":
        "Near Fire Station Shyama Prasad Mukherjee Marg Old Delhi New Delhi Delhi 110006",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "13:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "c236486c-3dc1-45d3-a43a-3c75dd260cd4",
        "date": "01-09-2021",
        "available_capacity": 63,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-01:00PM"
        ],
        "available_capacity_dose1": 36,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 723499,
    "name": "GGSS DEPUTY GANJ Site 2",
    "address": "DEPUTY GANJ",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "3c385820-c8e7-4c74-a555-9ec22f577dc6",
        "date": "01-09-2021",
        "available_capacity": 78,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 51,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "eab4fdab-6cd7-4686-81f2-7ed858022ec3",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "f5c883f6-1011-4dbd-86d9-8d20782c3cd8",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 723485,
    "name": "GBSSS Ramjas Lane Karol Bagh3",
    "address": "Karol Bagh",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "3b4f8efa-2bcc-41a6-8ca5-9b12a4f11743",
        "date": "01-09-2021",
        "available_capacity": 57,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 34,
        "available_capacity_dose2": 23
      },
      {
        "session_id": "c3069ba1-2cd0-49c0-a487-690a620b8d75",
        "date": "02-09-2021",
        "available_capacity": 83,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 59,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "532f35cb-c738-4245-81b4-6599f31e0353",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 580272,
    "name": "Hindu Rao Hosl DH SITE 2",
    "address": "HINDU RAO HOSPITAL MALKA GANJ",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "4652e523-c4b3-42ec-9daf-f1be5ce2bfa9",
        "date": "01-09-2021",
        "available_capacity": 77,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 51,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "c0768abf-de4c-4144-aec5-1bf5572cb44d",
        "date": "02-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "006e4c5f-4244-4717-8e3b-e4f5b0481187",
        "date": "03-09-2021",
        "available_capacity": 95,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 702684,
    "name": "S.S Jain KP Chandani Chowk",
    "address": "Gali Sanhian Chandani Chowk",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "a7b18412-151e-4c0e-8234-90762085f385",
        "date": "01-09-2021",
        "available_capacity": 74,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 60,
        "available_capacity_dose2": 14
      },
      {
        "session_id": "bae50741-607c-4340-9b06-282f62febdb5",
        "date": "02-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 65,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "8c665aa6-aa71-4c88-aa97-4b8eae46fa31",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 694891,
    "name": "NIGAM PRATIBHA V KAMLA NAGAR 5",
    "address": "E - Block Kamla Nagar Double Storey (Ward No. 78)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "66f2cef8-6520-4c46-af09-509fa5652779",
        "date": "01-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "d0a8f255-d84f-4f29-805c-a1590ac68d69",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "969d664b-b9ce-4c3d-acd1-166de11cacb6",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 693763,
    "name": "SBV JAMA MASJID URDU SITE 2",
    "address": "Jama Masjid (Urdu Medium)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "ea32c5ba-c721-4563-a84c-87bafcf328d2",
        "date": "01-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "9300f89e-a49a-4447-80ab-a65c2a975b75",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 67,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "51ca5e3b-ff17-4f8d-990d-cc8839c23fd0",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 747809,
    "name": "Sir Ganga Ram Hospital 4",
    "address": "Sir Ganga Ram Hospital Old Rajinder Nagar New Delhi 110060",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 0,
    "long": 0,
    "from": "09:00:00",
    "to": "16:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "1cf9ff02-4ca8-4871-a6c5-dd8f428979c7",
        "date": "01-09-2021",
        "available_capacity": 291,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 146,
        "available_capacity_dose2": 145
      },
      {
        "session_id": "45b715c5-1a43-4100-8ca2-f5ef718ea48f",
        "date": "03-09-2021",
        "available_capacity": 293,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 149,
        "available_capacity_dose2": 144
      },
      {
        "session_id": "c5537732-c660-446f-8895-57439e9cbfd5",
        "date": "04-09-2021",
        "available_capacity": 296,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 148,
        "available_capacity_dose2": 148
      },
      {
        "session_id": "5d4a9112-42bd-4d4b-a149-c7ad8e550022",
        "date": "05-09-2021",
        "available_capacity": 294,
        "min_age_limit": 45,
        "allow_all_age": false,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-04:00PM"
        ],
        "available_capacity_dose1": 147,
        "available_capacity_dose2": 147
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 702708,
    "name": "GBSSS Ramjas Lane Karol Bagh",
    "address": "Karol Bagh",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "80f007ef-a59d-4f45-8ed0-796dca27a4ab",
        "date": "01-09-2021",
        "available_capacity": 9,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 2,
        "available_capacity_dose2": 7
      },
      {
        "session_id": "11fd5f9f-ca78-4bf8-9738-996d7fc56629",
        "date": "02-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 60,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "e66dedaa-c989-4d44-bc7e-0a34cc8b0f93",
        "date": "03-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 65,
        "available_capacity_dose2": 25
      }
    ]
  },
  {
    "center_id": 747949,
    "name": "Vidhya Bhawan School R Nagar 2",
    "address": "Rajender Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110060,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "191c80e5-99bc-442f-98a8-5f98e3485179",
        "date": "01-09-2021",
        "available_capacity": 84,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 57,
        "available_capacity_dose2": 27
      },
      {
        "session_id": "6604db3d-2262-44d2-ac2f-8ecc30ad454e",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "bef085d2-67b6-4c38-9c41-22fc90e259d0",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 693446,
    "name": "Sarvodhya V Mori G NO.1 SITE 1",
    "address": "Mori Gate No.1",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "c4846e54-a5a6-47d2-ba4e-7ad0b0230c5c",
        "date": "01-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 62,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "d0e7d8ba-bdf6-443f-829f-949650e8b33c",
        "date": "02-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "c735b9a3-8b73-4396-ad29-8bbc0f8114e3",
        "date": "03-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 23
      }
    ]
  },
  {
    "center_id": 580268,
    "name": "Girdhari Lal SITE 1",
    "address": "MRS GLM Hospital",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110002,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "f2764213-3702-42da-9b43-c4267763a96c",
        "date": "01-09-2021",
        "available_capacity": 82,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 58,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "c0aa5d72-f9b4-49d2-aa27-e7c08a19c3a0",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "41e0849d-2534-4c33-8dfa-623a920d4cc9",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 723492,
    "name": "MCD S ARUNA NAGAR Site 2",
    "address": "ARUNA NAGAR MAJNU KA TILA",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "a97bfc2d-09eb-49b0-987d-6144245bf746",
        "date": "01-09-2021",
        "available_capacity": 92,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "2e92bf6e-e308-4a87-8361-aa28cd14b242",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "a6acbeab-edc4-462f-97f9-039bda923f81",
        "date": "03-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 711063,
    "name": "MCD PRI. SCHOOl TRUKMAAN GATE",
    "address": "TRUKMAAN GATE",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110002,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "da7ba2e1-de0d-412f-95b7-516013cb3e92",
        "date": "01-09-2021",
        "available_capacity": 83,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 62,
        "available_capacity_dose2": 21
      },
      {
        "session_id": "4812ffd7-bec4-4eb4-94b4-81eb0a4adcd1",
        "date": "02-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 26
      },
      {
        "session_id": "7ddf31db-c588-4a9a-9b8a-5d2f630a1a82",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 560737,
    "name": "Burari Hospital Site 2",
    "address": "Kaushik Enclave Shankarpura Burari",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 76,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "980fc665-50ef-4f72-b04a-73d6369c4505",
        "date": "01-09-2021",
        "available_capacity": 2,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 2
      },
      {
        "session_id": "65fd733a-e90d-44fb-958e-956075bb2366",
        "date": "02-09-2021",
        "available_capacity": 29,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 6,
        "available_capacity_dose2": 23
      },
      {
        "session_id": "e87210d7-893d-4e17-905c-57f9e744f69a",
        "date": "03-09-2021",
        "available_capacity": 81,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 53,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 560700,
    "name": "LNJP Hospital Site 4",
    "address": "JLNMarg New Delhi-",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "ba43b730-94e0-47fb-bc3f-6b5d80d889c9",
        "date": "01-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "bce7572f-2504-47c0-9025-887091b48f85",
        "date": "02-09-2021",
        "available_capacity": 99,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "68c37347-9e54-450f-8153-1eabdc52eb4e",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 693450,
    "name": "SBV JAMA MASJID URDU SITE 1",
    "address": "Jama Masjid (Urdu Medium)",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "96f2ed49-5cdf-4e6a-ac36-b46eb5fcb00e",
        "date": "01-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "c159c12a-69d3-4dfc-af33-8c4581489aec",
        "date": "02-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 64,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "f31c81d9-8439-4334-b16c-3eeff6c45ea1",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 609999,
    "name": "Lala Duli Chand Polyclinic",
    "address": "Lala Duli Chand PolyclinicBara Hindu Rao",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "0bf24b26-7a0c-4f49-9e02-1bb12240dcb5",
        "date": "01-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "ec870822-ad6a-401b-8a84-f86824dc7358",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "8f243de8-ddaa-4bc0-aa91-b7a44adfe657",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 781079,
    "name": "BL MAX Kapoor Medical Naraina",
    "address": "E-18 OPPOSTIE BIKANERWALA NARINA VIHAR",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "15:00:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "5e448055-7fe2-42b1-8b5b-fe0f18cbf773",
        "date": "01-09-2021",
        "available_capacity": 1,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-10:00AM",
          "10:00AM-11:00AM",
          "11:00AM-12:00PM",
          "12:00PM-03:00PM"
        ],
        "available_capacity_dose1": 0,
        "available_capacity_dose2": 1
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 580262,
    "name": "Balak Ram Hospital SITE 1",
    "address": "BALAK RAM HOSPITAL TIMAR PUR DELHI 110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "07fa9292-4f42-4c9c-be51-0a7d242260e2",
        "date": "01-09-2021",
        "available_capacity": 76,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 51,
        "available_capacity_dose2": 25
      },
      {
        "session_id": "3761dfab-c948-4ffb-8dfc-d51028e9ea7f",
        "date": "02-09-2021",
        "available_capacity": 94,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 66,
        "available_capacity_dose2": 28
      },
      {
        "session_id": "5cefbab4-f547-4765-91ec-07d9fe4633a3",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 560765,
    "name": "Dr B L Kapur Hospital Site 1",
    "address": "PUSA ROAD RAJINDRA PLACE NEW DELHI 110005",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "17:30:00",
    "fee_type": "Paid",
    "sessions": [
      {
        "session_id": "7ea81add-4a42-408a-8c7e-6803d207f26f",
        "date": "01-09-2021",
        "available_capacity": 1952,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 976,
        "available_capacity_dose2": 976
      },
      {
        "session_id": "bc741610-bfaf-4d63-b6c6-fc2abc36dc35",
        "date": "02-09-2021",
        "available_capacity": 1987,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 999,
        "available_capacity_dose2": 988
      },
      {
        "session_id": "fab528a3-51eb-4934-9a7c-45e008794fa9",
        "date": "03-09-2021",
        "available_capacity": 1979,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 997,
        "available_capacity_dose2": 982
      },
      {
        "session_id": "ecce82a0-e83b-41b5-84ec-d46ed93a115c",
        "date": "04-09-2021",
        "available_capacity": 1961,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 995,
        "available_capacity_dose2": 966
      },
      {
        "session_id": "2db5c11c-7e95-4a47-9039-d432a3fd80bd",
        "date": "05-09-2021",
        "available_capacity": 1993,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 998,
        "available_capacity_dose2": 995
      },
      {
        "session_id": "0933c88b-298c-4620-bf20-3e73e6da82ab",
        "date": "06-09-2021",
        "available_capacity": 1991,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 998,
        "available_capacity_dose2": 993
      },
      {
        "session_id": "655e266a-47b1-454d-8d4f-27aa72f8b218",
        "date": "07-09-2021",
        "available_capacity": 1994,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": [
          "09:00AM-11:00AM",
          "11:00AM-01:00PM",
          "01:00PM-03:00PM",
          "03:00PM-05:30PM"
        ],
        "available_capacity_dose1": 997,
        "available_capacity_dose2": 997
      }
    ],
    "vaccine_fees": [
      {"vaccine": "COVISHIELD", "fee": "780"}
    ]
  },
  {
    "center_id": 4418,
    "name": "LNJP Hospital DH Site 1",
    "address": "JLNMarg New Delhi-",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "7106414d-8ec2-4f7b-b8d6-7040cdc7b3f5",
        "date": "01-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "dd0287c1-f997-4ecd-8065-5950f893d048",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "96c93c88-09cb-405e-bc34-9c1c40e5cb22",
        "date": "03-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 563048,
    "name": "G.B.Pant Hospital DH SITE 2",
    "address": "J.L.N Marg Delhi Gate New Delhi 110001",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110001,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "3cfc5ddc-22db-4f6d-89c1-c4bc3a3bd0b5",
        "date": "01-09-2021",
        "available_capacity": 52,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 48,
        "available_capacity_dose2": 4
      },
      {
        "session_id": "8eba2b87-83be-401b-8292-15d136703c06",
        "date": "02-09-2021",
        "available_capacity": 61,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 50,
        "available_capacity_dose2": 11
      },
      {
        "session_id": "3a761eb3-c18c-4cd9-802b-45a60189b93a",
        "date": "03-09-2021",
        "available_capacity": 93,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 25
      }
    ]
  },
  {
    "center_id": 658584,
    "name": "Balak Ram Hospital SITE 4",
    "address": "BALAK RAM HOSPITAL TIMAR PUR DELHI 110054",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110054,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "abfefa88-0d36-424d-8010-dd9a808e5757",
        "date": "01-09-2021",
        "available_capacity": 87,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 57,
        "available_capacity_dose2": 30
      },
      {
        "session_id": "35cd7d0d-5631-4169-8b99-c2d8039326aa",
        "date": "02-09-2021",
        "available_capacity": 98,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 29
      },
      {
        "session_id": "427ca640-6ca1-4477-a0d7-73e46c599d42",
        "date": "03-09-2021",
        "available_capacity": 100,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 30
      }
    ]
  },
  {
    "center_id": 723483,
    "name": "GBSSS Ramjas Lane Karol Bagh 2",
    "address": "Karol Bagh",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "5e9b8c00-2df1-4544-9ca7-f39b7251f32d",
        "date": "01-09-2021",
        "available_capacity": 28,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 10,
        "available_capacity_dose2": 18
      },
      {
        "session_id": "2b0f759a-b747-4ead-8948-b1d8cd076ffe",
        "date": "02-09-2021",
        "available_capacity": 86,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 62,
        "available_capacity_dose2": 24
      },
      {
        "session_id": "6bcf5af3-f7ec-4047-a882-3c763445b7dc",
        "date": "03-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 69,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 8066,
    "name": "CGHS Dispensary Subzi Mandi",
    "address": "A-517 Shastri Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "b07fc1db-e01a-47a4-a561-cde0ae3e306a",
        "date": "02-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 62,
        "available_capacity_dose2": 27
      }
    ]
  },
  {
    "center_id": 4383,
    "name": "Lady Reading Health School PHC",
    "address": "Ram Chand Lohiya MCH Centre Bara Hindu Roa Delhi- 6",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "ee0b5042-79c4-4d04-b9bb-563cf06dc170",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 4689,
    "name": "MCW Burari PHC",
    "address":
        "M And CW BURARI Burari Chowk Burari Mor  Near Hariyana Dairy HANUMAN MANDIR DELHI-84",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110084,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "a9334e55-5bed-4a92-98f4-5151d46b94f1",
        "date": "02-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 60,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 4670,
    "name": "MCW Bagh Kare Khan PHC",
    "address":
        "M And CW Centre Bagh Kare Khan Pantsnala Marg Kishan Ganj Delhi -110007",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "36ade4da-3b7e-4f27-8428-51f602d9e04b",
        "date": "02-09-2021",
        "available_capacity": 97,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 29
      }
    ]
  },
  {
    "center_id": 7935,
    "name": "CGHS CG Road PHC",
    "address":
        "CGHS Dipensary Building Amar Bagh Chitra Gupta Road New Delhi 110055",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110055,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "55f87768-b281-4e8b-ad35-80c1bddbbf97",
        "date": "02-09-2021",
        "available_capacity": 79,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 55,
        "available_capacity_dose2": 24
      }
    ]
  },
  {
    "center_id": 4776,
    "name": "MH Kamla Nehru CHC",
    "address":
        "Maternity Home Kamla Nehru Vivekanand Padam Nagar Sarai Rohilla Delhi-7",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "c02ff2e2-7d64-4d2f-a7aa-7361cd32cf80",
        "date": "02-09-2021",
        "available_capacity": 96,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 68,
        "available_capacity_dose2": 28
      }
    ]
  },
  {
    "center_id": 4248,
    "name": "CGHS Dev Nagar PHC",
    "address":
        "H2 Block First Floor CPWD Building Dev Nagar Near Sai Baba Mandir",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110005,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "86ed071c-967d-4c7d-8d03-2f22830e64d1",
        "date": "02-09-2021",
        "available_capacity": 69,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 46,
        "available_capacity_dose2": 23
      }
    ]
  },
  {
    "center_id": 580273,
    "name": "MAMC SITE 1",
    "address": "MAMC Campus",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110006,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "111b7e12-ffb1-4107-a021-77d9f781141f",
        "date": "02-09-2021",
        "available_capacity": 90,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 20
      },
      {
        "session_id": "f0310659-03a4-4ee7-9940-9436cd2a390e",
        "date": "03-09-2021",
        "available_capacity": 88,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVAXIN",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 70,
        "available_capacity_dose2": 18
      }
    ]
  },
  {
    "center_id": 4378,
    "name": "ESI Dispensary Shastri Nagar",
    "address":
        "ESI Dispensary Shastrinagar Near Shastri Nagar Metro Station Shastri Nagar",
    "state_name": "Delhi",
    "district_name": "Central Delhi",
    "block_name": "Not Applicable",
    "pincode": 110007,
    "lat": 28,
    "long": 77,
    "from": "09:00:00",
    "to": "12:00:00",
    "fee_type": "Free",
    "sessions": [
      {
        "session_id": "b403fcc6-525a-43f8-9ca1-b5a3ffd2ea28",
        "date": "02-09-2021",
        "available_capacity": 89,
        "min_age_limit": 18,
        "allow_all_age": true,
        "vaccine": "COVISHIELD",
        "slots": ["09:00AM-11:00AM", "11:00AM-12:00PM"],
        "available_capacity_dose1": 61,
        "available_capacity_dose2": 28
      }
    ]
  }
];
