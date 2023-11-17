import 'package:flutter/material.dart';
import 'package:foody/screens/details.dart';
import 'screens/home.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food recipe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
        ),
        ),
        home: Home(),
    );
  }
}
