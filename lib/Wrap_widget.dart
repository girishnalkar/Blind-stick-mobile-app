import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WrapExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Widget"),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(10),

        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 10.0,
          runSpacing: 10.0,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,

          children: [
            box("A", Colors.red),
            box("B", Colors.blue),
            box("C", Colors.green),
            box("D", Colors.orange),
            box("E", Colors.purple),
            box("F", Colors.teal),
            box("G", Colors.brown),
          ],
        ),
      ),
    );
  }

  Widget box(String text, Color color) {
    return Container(
      height: 80,
      width: 80,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}