import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'login_page.dart';
import 'accessibility_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AccessibilityService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}