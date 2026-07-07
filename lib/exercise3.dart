import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Extra Widgets",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool checkboxValue = false;
  int radioValue = 1;
  double sliderValue = 30;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTimeRange? selectedRange;

  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];

  final TextEditingController controller = TextEditingController();

  // Date Picker
  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    setState(() {
      selectedDate = date;
    });
  }

  // Time Picker
  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      selectedTime = time;
    });
  }

  // Date Range Picker
  Future<void> pickRange() async {
    DateTimeRange? range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    setState(() {
      selectedRange = range;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Extra Widgets")),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // TextFormField
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // SelectableText
            SelectableText(
              "You can copy this text",
              style: TextStyle(fontSize: 18),
            ),

            // TextButton
            TextButton(
              onPressed: () {
                print("TextButton clicked");
              },
              child: Text("Text Button"),
            ),

            // IconButton
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print("IconButton clicked");
              },
            ),

            // Radio
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (val) {
                    setState(() {
                      radioValue = val as int;
                    });
                  },
                ),
                Text("Option 1"),

                Radio(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (val) {
                    setState(() {
                      radioValue = val as int;
                    });
                  },
                ),
                Text("Option 2"),
              ],
            ),

            // RadioListTile
            RadioListTile(
              title: Text("Radio List Tile"),
              value: 3,
              groupValue: radioValue,
              onChanged: (val) {
                setState(() {
                  radioValue = val as int;
                });
              },
            ),

            // CheckboxListTile
            CheckboxListTile(
              title: Text("Accept Terms"),
              value: checkboxValue,
              onChanged: (val) {
                setState(() {
                  checkboxValue = val!;
                });
              },
            ),

            // Slider
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (val) {
                setState(() {
                  sliderValue = val;
                });
              },
            ),

            // Date Picker
            ElevatedButton(
              onPressed: pickDate,
              child: Text("Pick Date"),
            ),

            // Time Picker
            ElevatedButton(
              onPressed: pickTime,
              child: Text("Pick Time"),
            ),

            // Date Range Picker
            ElevatedButton(
              onPressed: pickRange,
              child: Text("Pick Date Range"),
            ),

            // Navigator Example
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Text("Go to Second Page"),
            ),

            SizedBox(height: 20),

            // ListView.builder
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("List Item $index"),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // ReorderableListView
            Container(
              height: 200,
              child: ReorderableListView(
                children: [
                  for (final item in items)
                    ListTile(
                      key: ValueKey(item),
                      title: Text(item),
                    )
                ],
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex--;
                    final item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Go Back"),
        ),
      ),
    );
  }
}