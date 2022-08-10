import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:odnoklassniki_sdk/odnoklassniki_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';
  String secret = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    try {
      final okAuth = await OdnoklassnikiSdk.login();
      setState(() {
        token = okAuth.token;
        secret = okAuth.secret;
      });
    } on PlatformException catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.assignment_ind),
              onPressed: initPlatformState,
            )
          ],
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Text('Token: $token'),
                Text('Secret: $secret'),
              ],
            )
        ),
      ),
    );
  }
}
