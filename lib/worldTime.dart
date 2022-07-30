import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name
  String time = ''; // current location time
  String flag; // url asset flag icon
  String url; // url api endpoint
  bool isDayTime = false; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    //http://worldtimeapi.org/api/timezone/Europe

    try {
      var uri = Uri.http('worldtimeapi.org', 'api/timezone/$url');
      var response = await http.get(uri);
      Map dataJson = jsonDecode(response.body);
      String datetime = dataJson['datetime'];
      String offset = dataJson['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = (now.hour > 6 && now.hour < 18) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not find the location time';
    }
  }
}
