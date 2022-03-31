import 'package:flutter/material.dart';
import 'package:wed_planner/intro_screen.dart';
import 'package:wed_planner/theme.dart';
//import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wed Planner',
      theme: theme(),
      home: IntroScreen(),
    );
  }
}


