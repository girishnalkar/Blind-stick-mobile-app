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
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("ListView.builder")),
        body: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.list),
              title: Text(items[index]),
              subtitle: Text("subtitle ${items[index]}"),
              trailing: Icon(Icons.square_sharp),
              onTap: () {
                print("${items[index]} clicked");
              },
            );
          },
        ),
      ),
    );
  }
}