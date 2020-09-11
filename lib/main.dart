import 'package:flutter/material.dart';
import 'package:reagenda/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reagenda',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}