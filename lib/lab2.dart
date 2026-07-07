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
        appBar: AppBar(title: Text("Basic Flutter UI")),
        body: Center(
          child: Card(
            elevation: 5,
            child: Container(
              width: 300,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                    NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnJEd94ruuzZPfCrXxX6h9AtzCnIAaZc9yqw&s"),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Flutter Card",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Basic UI",
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 10),

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: Colors.red),
                      SizedBox(width: 10),
                      Icon(Icons.thumb_up, color: Colors.orange),
                      SizedBox(width: 10),
                      Icon(Icons.share, color: Colors.blue),
                    ],
                  ),

                  SizedBox(height: 10),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your name",
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                        onPressed: () {
                          print("Submit clicked");
                        },
                        child: Text("Submit"),
                      ),

                      OutlinedButton(
                        onPressed: () {
                          print("Cancel clicked");
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("More Information"),
                    subtitle: Text("Tap for details"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}