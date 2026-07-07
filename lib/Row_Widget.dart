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
          title: Text("Row Widget"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            textDirection: TextDirection.ltr,
            verticalDirection: VerticalDirection.down,

            children: [
              Container(
                width: 60,
                height: 60,
                color: Colors.red,
              ),

              Container(
                width: 60,
                height: 60,
                color: Colors.green,
              ),

              Container(
                width: 60,
                height: 60,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}