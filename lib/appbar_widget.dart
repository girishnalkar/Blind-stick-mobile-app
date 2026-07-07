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
          title: Text("AppBar"),
          centerTitle: true,

          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),

          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],

          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 10,
          shadowColor: Colors.black,

          toolbarHeight: 80,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Text(
              "Subtitle Area",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        body: Center(
          child: Text(
            "Above There is a AppBar",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

        ),
      ),
    );
  }
}