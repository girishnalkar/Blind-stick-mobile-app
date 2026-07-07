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
        appBar: AppBar(title: Text("IconButton")),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                print("pressed");
              },

              onLongPress: () {
                print("Long Pressed");
              },
              focusNode: FocusNode(),
              autofocus: true,
              splashColor: Colors.white,
              highlightColor: Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              iconSize: 30,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.touch_app,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}