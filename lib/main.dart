import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patico/home.dart';
import 'package:patico/pages/login_register/login_page.dart';

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
      home: LoginPage(),
    );
  }
}
