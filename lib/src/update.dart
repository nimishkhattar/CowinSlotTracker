import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Data/Globalvariable.dart' as global;

Future<int> fetchstates(
    {String url, String districtid, String pin, String type}) async {
  Map<String, String> data = {'Accept-Language': 'hi_IN'};
  global.states = ['Select States'];
  final response = await http.get(Uri.parse(url), headers: data);
  if (response.statusCode == 200) {
    global.noofstates = jsonDecode(response.body)['states'].length;
    for (int stateindex = 0; stateindex < global.noofstates; stateindex++)
      global.states.insert(
          0, (jsonDecode(response.body)['states'][stateindex]['state_name']));
    return 1;
  } else {
    print('not found');
    // return ('Failed to load');
    throw Exception('Failed to load');
  }
}
// String dad;
//   dynamic date;
//   if (type == 'pin' || type == 'district') {
//     date = DateTime.now().toString().split(' ')[0].split('-');
//     dad = date[2].toString() +
//         '-' +
//         date[1].toString() +
//         '-' +
//         date[0].toString();
//   }