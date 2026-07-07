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
          title: Text("SizedBox"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [

              Container(
                width: 150,
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text("Box 1", style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(height: 30),

              Container(
                width: 150,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text("Box 2", style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(
                height: 80,
                child: Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text("Fixed Height Box"),
                  ),
                ),
              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    color: Colors.red,
                  ),

                  SizedBox(width: 20),

                  Container(
                    width: 80,
                    height: 40,
                    color: Colors.purple,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}