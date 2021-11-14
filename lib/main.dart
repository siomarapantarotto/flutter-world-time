import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (Context) => Loading(),
        '/home': (Context) => Home(),
        '/location': (Context) => ChooseLocation(),
      },
    )
);
