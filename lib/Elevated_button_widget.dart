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
          title: Text("ElevatedButton"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print("Button Pressed");
            },

            onLongPress: () {
              print("Long Pressed");
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 10,
              padding: EdgeInsets.all(15),
              minimumSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            child: Text(
              "Click Me",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}