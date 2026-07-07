import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Icon Widget"),
        ),
        body: Center(
          child: Icon(
            Icons.star,
            size: 60.0,
            color: Colors.red,
            fill: 1.0,
            weight: 400,
            grade: 0,
            opticalSize: 48,
            semanticLabel: "Star Icon",
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}