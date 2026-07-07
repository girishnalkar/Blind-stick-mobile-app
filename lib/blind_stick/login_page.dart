import 'package:flutter/material.dart';
import 'home.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'accessibility_service.dart';
import 'user_session.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _statusText = 'Tap the mic and say your name';
  String _recognizedText = '';

  // 🎤 Start listening
  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
          _checkVoice();
        }
      },
      onError: (error) {
        setState(() {
          _isListening = false;
          _statusText = 'Mic Error. Try again.';
        });
        AccessibilityService.speak(_statusText);
        AccessibilityService.vibrateError();
      },
    );

    if (available) {
      setState(() {
        _isListening = true;
        _statusText = 'Listening...';
      });

      await AccessibilityService.speak(
          "Listening. Please say your name now.");
      await Future.delayed(const Duration(milliseconds: 500));

      _speech.listen(
        onResult: (result) {
          setState(() {
            _recognizedText = result.recognizedWords.toLowerCase();
          });
        },
        listenFor: const Duration(seconds: 5),
      );
    }
  }

  // 🧠 Voice processing
  void _checkVoice() {
    String rawText = _recognizedText.toLowerCase();

    String cleanedText = rawText
        .replaceAll("listening", "")
        .replaceAll("please say your name now", "")
        .replaceAll("please say your name", "")
        .replaceAll(RegExp(r'[.,!]'), '')
        .trim();

    print("DEBUG: Final name heard: '$cleanedText'");

    if (cleanedText.isEmpty) return;

    String userName = "User";
    String userPhone = "";

    // 🔥 Match voice → assign name + phone
    if (cleanedText.contains("girish") ||
        cleanedText.contains("gireesh") ||
        cleanedText.contains("giris")) {
      userName = "Girish";
      userPhone = "8767445546";
    } else if (cleanedText.contains("abhiram") ||
        cleanedText.contains("abiram") ||
        cleanedText.contains("abhi ram")) {
      userName = "Abhiram";
      userPhone = "9324479267";
    }

    // ❌ If not recognized
    if (userPhone.isEmpty) {
      _statusText =
      "You said '$cleanedText', but I don't recognize that name.";
      AccessibilityService.speak(_statusText);
      AccessibilityService.vibrateError();
      setState(() {});
      return;
    }

    // ✅ Store user session (IMPORTANT FIX)
    UserSession.setUser(userName, userPhone);

    print("Logged in as: $userName");
    print("Phone: $userPhone");

    _statusText = 'Welcome $userName! Logging you in.';
    AccessibilityService.speak(_statusText);
    AccessibilityService.vibrateSuccess();
    setState(() {});

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SmartStickHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Header
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
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
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Text('Navigation Assistant',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
              const Text('Welcome!',
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 60),

              // 🎤 Mic Button
              Semantics(
                label: _isListening
                    ? "Stop listening"
                    : "Voice Login Button. Tap to say your name.",
                button: true,
                child: GestureDetector(
                  onTap: _isListening
                      ? () => _speech.stop()
                      : _startListening,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: _isListening
                          ? Colors.red
                          : const Color(0xFF5C6BC0),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (_isListening
                              ? Colors.red
                              : const Color(0xFF5C6BC0))
                              .withValues(alpha: 0.4),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Status Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  _statusText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}