import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Jardin',
      theme: ThemeData(fontFamily: 'Roboto', primaryColor: Color(0xFFFF8152)),
      home: MyHomePage(title: 'Mon Jardin'),
    );
  }
}
