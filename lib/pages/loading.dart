import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    //var url = Uri.parse('http://localhost:9060/v1/funcoes');
    //var url = Uri.parse('http://10.8.41.152:9060/v1/funcoes');
    //var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    // body looks like a map but it is a string
    print('Response body: ${response.body}');
    // here is the way to decode the string to extract the attributes
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading screen'),
    );
  }
}
