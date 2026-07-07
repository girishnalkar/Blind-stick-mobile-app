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
          title: Text("Text Widget"),
        ),
        body: Center(
          child: Text(
            "Hello, Welcome to Flutter",

            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.blue,
              backgroundColor: Colors.yellow,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 2.0,
              wordSpacing: 5.0,
              height: 2,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.dashed,
              fontFamily: "Roboto",
              shadows: [
                Shadow(
                  color: Colors.grey,
                  offset: Offset(2,2),
                  blurRadius: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}