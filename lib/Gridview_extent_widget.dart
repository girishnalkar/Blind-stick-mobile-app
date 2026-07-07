import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("GridView.extent")),
        body: GridView.extent(
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 50,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          children: items.map((item) {
            return Card(
              color: Colors.green,
              elevation: 5,
              child: InkWell(
                onTap: () {
                  print("$item clicked");
                },
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}