import 'package:flutter/material.dart';
import 'package:quiz_app/landing_page.dart';
import 'package:quiz_app/quiz_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LandingPage(),
    );
  }
}
