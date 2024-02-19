import 'dart:developer';

import 'package:banglaqrsdk/banglaqrsdk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _banglaqrsdkPlugin = Banglaqr();

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    await _banglaqrsdkPlugin.initializeBanglaQRSdk(
      primaryColorCode: "#6200EE",
      secondaryColorCode: "#6200EE",
      onSuccess: (response) {
        log('success:: ${response.toJson()}');
      },
      onError: (error) {
        log('error:: ${error}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            initPlatformState();
          },
        ),
        body: const Center(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
