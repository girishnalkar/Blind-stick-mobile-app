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
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          title: Text("Padding Widget"),
        ),
        body: Column(
          children: [

            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.blue,
                child: Text(
                  "Padding All",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                color: Colors.green,
                child: Text(
                  "Padding Symmetric",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 50, top: 20),
              child: Container(
                color: Colors.orange,
                child: Text(
                  "Padding Only",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(50, 60, 30, 20),
              child: Container(
                color: Colors.red,
                child: Text(
                  "Padding fromLTRB",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}