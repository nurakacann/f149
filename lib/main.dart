import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patico/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F-149',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
