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
          title: Text("Container Widget"),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.blue,  
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(5,5),
                )
              ],
            ),

            transform: Matrix4.rotationZ(0.1),

            constraints: BoxConstraints(
              minWidth: 100,
              minHeight: 100,
              maxWidth: 300,
              maxHeight: 300,
            ),

            child: Text(
              "Hello, This is container",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}