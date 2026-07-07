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
          title: Text("Scaffold"),
        ),

        body: Center(
          child: Text("Hello, This is basic layout structure"),
        ),

        backgroundColor: Colors.grey[200],

        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Menu"),
              ),
              ListTile(title: Text("Home")),
              ListTile(title: Text("Settings")),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),

        persistentFooterButtons: [
          TextButton(
            onPressed: () {},
            child: Text("OK"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Cancel"),
          ),
        ],

        endDrawer: Drawer(
          child: Center(child: Text("Right Drawer")),
        ),

        resizeToAvoidBottomInset: true,
      ),
    );
  }
}