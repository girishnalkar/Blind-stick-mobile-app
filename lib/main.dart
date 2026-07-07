import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = "Press button to connect";
  BluetoothConnection? connection;
  bool isConnecting = false;

  String buffer = "";

  void connectToHC05() async {
    setState(() {
      status = "Checking Bluetooth...";
      isConnecting = true;
    });

    try {
      await FlutterBluetoothSerial.instance.requestEnable();

      setState(() {
        status = "Searching HC-05...";
      });

      List<BluetoothDevice> devices =
      await FlutterBluetoothSerial.instance.getBondedDevices();

      for (var device in devices) {
        if (device.name != null && device.name!.contains("HC")) {
          setState(() {
            status = "Connecting to ${device.name}...";
          });

          connection =
          await BluetoothConnection.toAddress(device.address);

          setState(() {
            status = "Connected ✔";
          });

          connection!.input!.listen((data) {
            buffer += String.fromCharCodes(data);

            if (buffer.contains("\n")) {
              List<String> parts = buffer.split("\n");

              for (int i = 0; i < parts.length - 1; i++) {
                String line = parts[i].trim();

                if (line.isNotEmpty) {
                  setState(() {
                    status = line; // ONLY latest reading
                  });
                }
              }

              buffer = parts.last;
            }
          }).onDone(() {
            setState(() {
              status = "Disconnected";
              isConnecting = false;
            });
          });

          return;
        }
      }

      setState(() {
        status = "❌ HC-05 not found";
        isConnecting = false;
      });
    } catch (e) {
      setState(() {
        status = "❌ Error: $e";
        isConnecting = false;
      });
    }
  }

  @override
  void dispose() {
    connection?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Smart Blind Stick")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32), // big like monitor
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: isConnecting ? null : connectToHC05,
                child: Text("Connect HC-05"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}