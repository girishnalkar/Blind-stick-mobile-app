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
          title: Text("Image Widget Example"),
        ),
        body: Center(
          child: Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/006/026/259/small/tranquil-summer-vacation-holiday-landscape-tropical-island-sunset-beach-palms-shore-calm-sea-sand-exotic-nature-scenic-inspirational-and-peaceful-seascape-reflection-amazing-sky-sunset-photo.jpg",

            width: 200,
            height: 200,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
            color: Colors.red,
            colorBlendMode: BlendMode.colorBurn,
            filterQuality: FilterQuality.high,
            semanticLabel: "Sample image",
          ),
        ),
      ),
    );
  }
}