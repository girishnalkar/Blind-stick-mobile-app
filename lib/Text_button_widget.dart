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
        appBar: AppBar(title: Text("TextButton")),
        body: Center(
          child: TextButton(
            onPressed: () {
              print("pressed");
            },
            onLongPress: () {
              print("Long Pressed");
            },
            focusNode: FocusNode(),
            autofocus: true,
            clipBehavior: Clip.antiAlias,

            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              disabledForegroundColor: Colors.grey,
              disabledBackgroundColor: Colors.black12,

              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              minimumSize: Size(150, 50),
              maximumSize: Size(300, 70),

              side: BorderSide(color: Colors.black, width: 2),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              elevation: 5,
              shadowColor: Colors.black,
              alignment: Alignment.center,
              splashFactory: InkRipple.splashFactory,
            ),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.touch_app),
                SizedBox(width: 10),
                Text(
                  "Click Me",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}