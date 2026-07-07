import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  bool isSwitched = false;
  double sliderValue = 20;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("50 Widgets"),
        actions: [
          Icon(Icons.notifications),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Header"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Item 1"),
              subtitle: Text("Subitem 1"),
              trailing: Icon(Icons.e_mobiledata_sharp),
            ),
            ListTile(
              title: Text("Item 2")
            ),
            ListTile(
                title: Text("Item 3")
            ),
            ListTile(
                title: Text("Item 4")
            ),
            ListTile(
                title: Text("Item 5")
            ),
            ListTile(
                title: Text("Item 6")
            ),
            ListTile(
                title: Text("Item 7")
            ),
            ListTile(
                title: Text("Item 8")
            ),
            ListTile(
                title: Text("Item 9")
            ),
            ListTile(
                title: Text("Item 10")
            ),
            ListTile(
                title: Text("Item 11")
            ),
            ListTile(
                title: Text("Item 12")
            ),
            ListTile(
                title: Text("Item 13")
            ),
            ListTile(
                title: Text("Item 14")
            ),
            ListTile(
                title: Text("Item 15")
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),

            // Center(
            //   child: ElevatedButton(
            //     onPressed: incrementCounter,
            //     child: Text("Increment Counter"),
            //   ),
            // ),
            //
            // Center(
            //   child: FloatingActionButton(
            //     mini: true,
            //       onPressed: incrementCounter,
            //       child: Icon(Icons.add),
            //   )
            // ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      onPressed: incrementCounter,
                      child: Icon(Icons.add,color: Colors.orange),
                      mini: true,
                  ),

                  SizedBox(width: 10),

                  ElevatedButton(
                      onPressed: incrementCounter,
                      child: Text("Increment counter"))
                ],
              ),
            ),

            Text("Counter: $counter"),

            Divider(),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Row Text"),
                  Icon(Icons.star),
                ],
              ),
            ),

            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_UcbzOVEtzpiThlTe9udnaG2pOL1GIYXnTw&s",
              height: 100,
            ),

            Switch(
              value: isSwitched,
              onChanged: (val) {
                setState(() {
                  isSwitched = val;
                });
              },
            ),

            Checkbox(
              value: isSwitched,
              onChanged: (val) {
                setState(() {
                  isSwitched = val!;
                });
              },
            ),

            Slider(
              min: 0,
              max: 100,
              value: sliderValue,
              onChanged: (val) {
                setState(() {
                  sliderValue = val;
                });
              },
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter Text",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("A"),
                ),
                title: Text("Card Title"),
                subtitle: Text("Subtitle"),
                trailing: Text("Ending text"),
              ),
            ),

            Wrap(
              spacing: 10,
              children: [
                Chip(label: Text("Chip1")),
                Chip(label: Text("Chip2")),
              ],
            ),

            Stack(
              children: [
                Container(height: 100, color: Colors.grey),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text("Stack Text"),
                ),
              ],
            ),

            LinearProgressIndicator(),
            CircularProgressIndicator(),
            RefreshProgressIndicator(),

            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Tapped!")),
                );
              },
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Text("Tap Me"),
              ),
            ),

            Opacity(
              opacity: 0.5,
              child: Text("Half Visible Text"),
            ),

            SizedBox(height: 50), // added bottom spacing
          ],
        ),
      ),
    );
  }
}