import 'dart:async';
import 'package:flutter/material.dart';

import 'bluetooth_service.dart';
import 'accessibility_service.dart';
import 'user_session.dart';

class ConnectionPage extends StatefulWidget {
  final bool autoConnect;

  const ConnectionPage({Key? key, this.autoConnect = false}) : super(key: key);

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  String connectionStatus = "Not connected";
  String distanceText = "-- cm";
  double lastDistance = 0.0;

  bool isConnecting = false;

  DateTime? lastAlertTime;

  late StreamSubscription statusSub;
  late StreamSubscription distanceSub;

  @override
  void initState() {
    super.initState();

    _listenToStreams();

    AccessibilityService.speak(
      widget.autoConnect
          ? "Opening connection page. Connecting automatically."
          : "Connection page opened.",
    );

    if (widget.autoConnect) {
      Future.delayed(const Duration(seconds: 2), () {
        _manualConnect();
      });
    }
  }

  void _manualConnect() async {
    if (isConnecting) return;

    setState(() {
      isConnecting = true;
    });

    await AccessibilityService.speak("Connecting to your smart stick");

    await BluetoothService.connectToHC05();

    if (!mounted) return;

    setState(() {
      isConnecting = false;
    });
  }

  void _listenToStreams() {
    statusSub = BluetoothService.statusStream.listen((status) {
      if (!mounted) return;

      setState(() {
        connectionStatus = status;
      });

      AccessibilityService.speak(status);
    });

    distanceSub = BluetoothService.distanceStream.listen((data) {
      if (!mounted) return;

      final match = RegExp(r'\d+(\.\d+)?').firstMatch(data);

      if (match != null) {
        double distance = double.parse(match.group(0)!);

        setState(() {
          distanceText = "${distance.toInt()} cm";
          lastDistance = distance;
        });

        _handleObstacleAlert(distance);
      }
    });
  }

  void _handleObstacleAlert(double distance) {
    final now = DateTime.now();

    if (lastAlertTime != null &&
        now.difference(lastAlertTime!).inSeconds < 2) {
      return;
    }

    if (distance > 0 && distance < 20) {
      AccessibilityService.speak(
          "Stop! Obstacle very close at ${distance.toInt()} centimeters");
      AccessibilityService.vibrateError();
      lastAlertTime = now;
    } else if (distance >= 20 && distance < 50) {
      AccessibilityService.speak(
          "Caution. Obstacle at ${distance.toInt()} centimeters");
      AccessibilityService.vibrateWarning();
      lastAlertTime = now;
    } else if (distance >= 50 && lastDistance < 50) {
      AccessibilityService.speak("Path clear");
      AccessibilityService.vibrateSuccess();
      lastAlertTime = now;
    }
  }

  @override
  void dispose() {
    statusSub.cancel();
    distanceSub.cancel();
    BluetoothService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isConnected = connectionStatus.toLowerCase().contains("connected");

    final warningColor =
    (lastDistance > 0 && lastDistance < 50) ? Colors.redAccent : Colors.orange;

    return Scaffold(
      backgroundColor: const Color(0xFFDEDEEC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C6BC0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.accessible,
                          color: Colors.white, size: 26),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('SmartStick',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          Text(connectionStatus,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              if (!isConnected)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Text('Bluetooth Connection',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: isConnecting ? null : _manualConnect,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: isConnecting
                                ? Colors.grey
                                : const Color(0xFF5C6BC0),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: isConnecting
                                ? const CircularProgressIndicator(
                                color: Colors.white)
                                : const Icon(Icons.bluetooth,
                                color: Colors.white, size: 60),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        isConnecting ? 'Connecting...' : 'Tap to Connect',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

              if (isConnected) ...[
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: warningColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Obstacle Detection',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(distanceText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],

              const Spacer(),

              GestureDetector(
                onTap: () async {
                  await AccessibilityService.triggerSOS(UserSession.getUser());
                },
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('SOS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}