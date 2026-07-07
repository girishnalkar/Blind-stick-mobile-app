import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'accessibility_service.dart';
import 'bluetooth_service.dart';
import 'user_session.dart';
import 'connection_page.dart';

class SmartStickHome extends StatefulWidget {
  const SmartStickHome({super.key});

  @override
  State<SmartStickHome> createState() => _SmartStickHomeState();
}

class _SmartStickHomeState extends State<SmartStickHome> {
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool isNavigating = false; // 🔥 prevent multiple navigation

  @override
  void initState() {
    super.initState();
    _startSystem();
    _listenBluetoothStatus();
  }

  // 🔥 Start system
  void _startSystem() async {
    await AccessibilityService.speak(
      "Dashboard opened. Voice assistant active. say connect Bluetooth.",
    );

    Future.delayed(const Duration(seconds: 2), () {
      startVoiceAssistant();
    });
  }

  // 🔵 Listen Bluetooth status
  void _listenBluetoothStatus() {
    BluetoothService.statusStream.listen((status) {
      print("BT STATUS: $status");
      AccessibilityService.speak(status);
    });
  }

  // 🎤 Voice Assistant
  Future<void> startVoiceAssistant() async {
    print("🎤 Initializing speech...");

    bool available = await _speech.initialize(
      onStatus: (status) {
        print("STATUS: $status");

        if (status == "notListening") {
          _restartListening();
        }
      },
      onError: (error) {
        print("ERROR: $error");
        _restartListening();
      },
    );

    if (!available) return;

    await _speech.stop();

    _speech.listen(
      listenFor: const Duration(seconds: 8),
      pauseFor: const Duration(seconds: 2),
      partialResults: false,
      onResult: (result) {
        if (result.finalResult) {
          String command = result.recognizedWords.toLowerCase();
          print("COMMAND: $command");
          handleCommand(command);
        }
      },
    );

    print("🎤 Listening...");
  }

  // 🔁 Restart listening
  void _restartListening() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        startVoiceAssistant();
      }
    });
  }

  // 🧠 Handle commands
  void handleCommand(String command) {
    print("COMMAND RECEIVED: $command");

    // 🚨 SOS
    if (command.contains("s") &&
        (command.contains("o") || command.contains("oh"))) {
      AccessibilityService.speak("Emergency triggered");
      AccessibilityService.triggerSOS(UserSession.getUser());
    }

    // 🔵 Bluetooth Navigation
    else if (command.contains("blue") ||
        command.contains("bluetooth") ||
        command.contains("connect")) {
      _navigateToConnection();
    }

    // ❓ Unknown
    else {
      AccessibilityService.speak("Command not recognized");
    }
  }

  // 🔥 Navigation Function (clean + reusable)
  void _navigateToConnection() {
    if (isNavigating) return;

    isNavigating = true;

    AccessibilityService.speak("Opening connection page");

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionPage(autoConnect: true),
      ),
    ).then((_) {
      isNavigating = false;
    });
  }

  // 🔴 Tap SOS
  Future<void> _handleSOS() async {
    await AccessibilityService.triggerSOS(UserSession.getUser());
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── Header ──
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C6BC0),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.accessible,
                          color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 14),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SmartStick',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        Text('Navigation Assistant',
                            style:
                            TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Bluetooth Button ──
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CONNECT BLUETOOTH',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: _navigateToConnection,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xFF5C6BC0),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'Bluetooth',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ── SOS ──
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SOS - Emergency',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: _handleSOS,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'SOS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}