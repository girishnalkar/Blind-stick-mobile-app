import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar"),

            bottom: TabBar(
              isScrollable: false,
              indicatorColor: Colors.blue,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,

              labelColor: Colors.grey,
              unselectedLabelColor: Colors.black,

              labelStyle: TextStyle(fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 14),

              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.search), text: "Search"),
                Tab(icon: Icon(Icons.person), text: "Profile"),
              ],
            ),
          ),

          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(child: Text("Home Screen")),
              Center(child: Text("Search Screen")),
              Center(child: Text("Profile Screen")),
            ],
          ),
        ),
      ),
    );
  }
}