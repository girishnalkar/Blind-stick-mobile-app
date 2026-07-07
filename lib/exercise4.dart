import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GridExample extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.home, "title": "Home"},
    {"icon": Icons.person, "title": "Profile"},
    {"icon": Icons.settings, "title": "Settings"},
    {"icon": Icons.shopping_cart, "title": "Cart"},
    {"icon": Icons.favorite, "title": "Favorites"},
    {"icon": Icons.message, "title": "Messages"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Example"),
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(10),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),

        itemCount: items.length,

        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  items[index]["icon"],
                  size: 50,
                  color: Colors.blue,
                ),
                SizedBox(height: 10),
                Text(
                  items[index]["title"],
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}