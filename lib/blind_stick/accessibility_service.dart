import 'package:flutter_tts/flutter_tts.dart';
import 'package:vibration/vibration.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'user_session.dart';

class AccessibilityService {
  static final FlutterTts _tts = FlutterTts();

  // ── Emergency Contacts ──
  static const List<Map<String, String>> emergencyContacts = [
    {'name': 'Girish', 'phone': '123456789'},
    {'name': 'Abhiram', 'phone': '123456789'},
  ];

  // ── Initialize TTS ──
  static Future<void> init() async {
    await _tts.setLanguage("en-IN");
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    await _tts.awaitSpeakCompletion(true);
  }

  // ── TTS ──
  static Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }

  // ── Vibration ──
  static void vibrateSuccess() => Vibration.vibrate(duration: 100);
  static void vibrateError() =>
      Vibration.vibrate(pattern: [0, 200, 100, 200]);
  static void vibrateWarning() => Vibration.vibrate(duration: 1000);

  // ── SOS (SMS Only, Skip Self) ──
  static Future<void> triggerSOS(String userName) async {
    vibrateError();

    String name = userName.isEmpty ? "User" : userName;
    String currentUserPhone = UserSession.getPhone();

    await speak("S O S activated. Fetching your location.");

    try {
      // 📍 Location permission
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          await speak("Location permission denied.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        await speak("Location permission permanently denied.");
        return;
      }

      // 📡 Check GPS
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await speak("GPS is off. Please enable location.");
        return;
      }

      // 📍 Get location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      String mapsLink =
          "https://maps.google.com/?q=${position.latitude},${position.longitude}";

      String message =
          "🚨 EMERGENCY!\n$name needs help!\nLocation: $mapsLink";

      // 📩 Send to first valid contact (skip self)
      for (var contact in emergencyContacts) {
        if (contact['phone'] == currentUserPhone) {
          continue; // 🚫 skip self
        }

        String phone = "+91${contact['phone']}";

        final Uri smsUri = Uri.parse(
          "sms:$phone?body=${Uri.encodeComponent(message)}",
        );

        await launchUrl(smsUri);

        await speak("Message opened. Please tap send.");

        break; // send to only one contact
      }

      vibrateSuccess();

    } catch (e) {
      print("SOS ERROR: $e");
      await speak("S O S failed. Please try again.");
      vibrateError();
    }
  }
}