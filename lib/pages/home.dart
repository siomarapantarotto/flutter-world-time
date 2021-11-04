import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                child: Text('Choose location'),),





              // IconButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/location');
              //     },
              //     icon: const Icon(Icons.edit_location),
              // ),
            ],
          ),
      ),
    );
  }
}
