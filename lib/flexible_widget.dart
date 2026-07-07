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
          title: Text("Flexible Widget"),
        ),
        body: Row(
          children: [

            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                color: Colors.red,
                height: 50,
                child: Text("Flexible 1"),
              ),
            ),

            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.green,
                height: 50,
                child: Text("Flexible 2"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}