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
          title: Text("Column Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            verticalDirection: VerticalDirection.down,
            textDirection: TextDirection.ltr,

            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),

              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),

              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}