import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  late String time; // the time in that location
  String flag; // url to an asset  icon
  String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  // Returns void but only when this async function is fully complete.
  Future<void> getTime() async{

    try {

      // Make the request.

      // The commented line bellow is to try{} catch{error}
      //var urlWorldTime = Uri.parse('https://worldtimeapi.org/api/timezones/$url');
      var urlWorldTime = Uri.parse('https://worldtimeapi.org/api/timezone/$url');

      Response response = await get(urlWorldTime);
      Map data = jsonDecode(response.body);
      //print('data: $data');

      // Get properties from data.
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print('datetime: $datetime');
      //print('offset: $offset');

      // Create DateTime object.
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print('now: $now');

      // Set the time property of the class.
      //time = now.toString();
      time = DateFormat.jm().format(now);

    } catch (e) {
      print('ATTENTION ===> Caught an error: $e');
      time = 'ERROR: Could not get time data!';
    }

  }

}

