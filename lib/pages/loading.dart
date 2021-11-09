import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    // Make the request.
    var urlWorldTime = Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London');
    Response response = await get(urlWorldTime);
    Map data = jsonDecode(response.body);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    //String offset = data['utc_offset'];
    String offset = data['offset'];
    print(datetime);
    print(offset);

  }

  void getRhApi() async {
    //var url = Uri.parse('http://localhost:9060/v1/funcoes');
    var url = Uri.parse('http://10.8.41.152:9060/v1/funcoes');

    // Just a post syntax.
    //var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    Response response = await get(url);

    print('Response status: ${response.statusCode}');

    // "body" looks like a map but it is actually a string.
    print('Response body: ${response.body}');

    // This is the way to decode the string to extract the attributes.
    Map data = jsonDecode(response.body);
    print(data);
    print(data['userId']);
    print(data['id']);
    print(data['title']);
    print(data['completed']);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading screen'),
    );
  }
}
