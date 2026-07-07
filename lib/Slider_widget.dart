import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Slider")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                value: value,
                min: 0,
                max: 100,
                divisions: 10,
                label: value.round().toString(),
                onChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
              ),

              Text(
                "Value: ${value.toStringAsFixed(0)}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}