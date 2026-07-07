import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:async';

class BluetoothService {
  static BluetoothConnection? connection;
  static String buffer = "";
  static StreamController<String> distanceController = StreamController<String>.broadcast();
  static StreamController<String> statusController = StreamController<String>.broadcast();

  static Stream<String> get distanceStream => distanceController.stream;

  static Stream<String> get statusStream => statusController.stream;

  static Future<void> connectToHC05() async {
    statusController.add("Checking Bluetooth...");

    try {
      bool? isEnabled = await FlutterBluetoothSerial.instance.requestEnable();
      if (isEnabled == false) {
        statusController.add("Bluetooth is off. Please turn it on.");
        return;
      }

      statusController.add("Searching HC-05...");

      List<BluetoothDevice> devices =
      await FlutterBluetoothSerial.instance.getBondedDevices();

      BluetoothDevice? targetDevice;
      for (var device in devices) {
        if (device.name != null && device.name!.contains("HC")) {
          targetDevice = device;
          break;
        }
      }

      if (targetDevice == null) {
        statusController.add("HC-05 not found. Please pair it first in Bluetooth settings.");
        return;
      }

      statusController.add("Connecting to ${targetDevice.name}...");

      try {
        connection = await BluetoothConnection.toAddress(targetDevice.address)
            .timeout(const Duration(seconds: 10));

        statusController.add("Connected ✔");

        connection!.input!.listen((data) {
          buffer += String.fromCharCodes(data);

          if (buffer.contains("\n")) {
            List<String> parts = buffer.split("\n");
            for (int i = 0; i < parts.length - 1; i++) {
              String line = parts[i].trim();
              if (line.isNotEmpty) {
                distanceController.add(line);
              }
            }
            buffer = parts.last;
          }
        }).onDone(() {
          statusController.add("Disconnected");
          disconnect();
        });

      } on TimeoutException {
        statusController.add("Connection timeout. HC-05 may be off or out of range.");
      } catch (e) {
        statusController.add("Connection failed. Try unpairing and re-pairing HC-05.");
        print("Connection error: $e");
      }

    } catch (e) {
      statusController.add("Error: ${e.toString()}");
      print("Bluetooth error: $e");
    }
  }

  static void disconnect() {
    connection?.dispose();
    connection = null;
  }

  static bool isConnected() {
    return connection != null && connection!.isConnected;
  }
}