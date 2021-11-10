import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location = ""; // location name for the UI
  String time = ""; // the time in that location
  String flag = ""; // url to an asset  icon
  String url =""; // location url for api endpoint

  //WorldTime({required this.location, required this.flag, required this.url});

  WorldTime(this.location, this.flag, this.url, {String flag});

  Future<void> getTime() async{
    // Make the request.
    var urlWorldTime = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
    Response response = await get(urlWorldTime);
    Map data = jsonDecode(response.body);
    //print(data);

    // Get properties from data.
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    // Create DateTime object.
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

    // Set the time property.
    time = now.toString();

  }

}

