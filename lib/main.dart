import 'package:flutter/material.dart';
import 'package:masterdetail/master_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MasterScreen()
    );
  }
}
