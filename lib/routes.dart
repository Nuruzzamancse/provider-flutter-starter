import 'package:biofresh/uicontainers/Login/index.dart';
import 'package:flutter/material.dart';
import 'package:biofresh/uicontainers/Home/index.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => Home(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
