import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("ListView")),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.list),
              title: Text(items[0]),
              subtitle: Text("Subtitle ${items[0]}"),
              onTap: () {
                print("${items[0]} clicked");
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(items[1]),
              subtitle: Text("Subtitle ${items[1]}"),
              onTap: () {
                print("${items[1]} clicked");
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(items[2]),
              subtitle: Text("Subtitle ${items[2]}"),
              onTap: () {
                print("${items[2]} clicked");
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(items[2]),
              subtitle: Text("Subtitle ${items[3]}"),
              onTap: () {
                print("${items[3]} clicked");
              },
            ),
          ],
        ),
      ),
    );
  }
}