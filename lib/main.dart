import 'package:flutter/material.dart';
import 'package:patico/auth/login_or_register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'F-149',
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}
