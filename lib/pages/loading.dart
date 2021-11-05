import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    //var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    //var url = Uri.parse('http://localhost:9060/v1/funcoes');
    var url = Uri.parse('http://10.8.41.152:9060/v1/funcoes');
    //var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    Response response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    print(response.body);

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
