import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlignExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlignExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align Widget"),
      ),
      body:Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.grey[300],
          child: Align(
            alignment: Alignment.bottomRight,
            widthFactor: 2.0,
            heightFactor: 2.0,

            child: Container(
              height: 80,
              width: 80,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Box",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}