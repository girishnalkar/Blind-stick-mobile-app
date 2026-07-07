import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Addition App',
      home: const AdditionPage(),
    );
  }
}
class AdditionPage extends StatefulWidget {
  const AdditionPage({super.key});
  @override
  State<AdditionPage> createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int result = 0;
  void addNumbers() {
    int n1 = int.tryParse(num1Controller.text) ?? 0;
    int n2 = int.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = n1 + n2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addition Program'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter first number',
              ),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter second number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addNumbers,
              child: const Text('Add'),
            ),
            const SizedBox(height: 20),

            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}