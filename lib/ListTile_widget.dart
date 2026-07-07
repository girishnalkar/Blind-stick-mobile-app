import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTileExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListTileExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListTile"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Girish Nalkar"),
            subtitle: Text("VIT student"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Tile tapped");
            },
            onLongPress: () {
              print("Tile long pressed");
            },


            enabled: true,
            selected: true,
            selectedTileColor: Colors.blue.shade100,
            tileColor: Colors.grey.shade200,
            contentPadding: EdgeInsets.all(10),
            horizontalTitleGap: 10,
            minLeadingWidth: 40,
            isThreeLine: true,
            dense: false,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            visualDensity: VisualDensity(horizontal: 0, vertical: 0),
            focusColor: Colors.yellow,
            hoverColor: Colors.green,
            splashColor: Colors.red,
          ),
        ],
      ),
    );
  }
}