import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScrollExample extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        controller: _controller,
        primary: false,
        clipBehavior: Clip.hardEdge, 

        child: Column(
          children: List.generate(
            20,
                (index) => Container(
              height: 100,
              margin: EdgeInsets.all(8),
              color: Colors.blue[(index % 9 + 1) * 100],
              child: Center(
                child: Text(
                  "Item ${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}