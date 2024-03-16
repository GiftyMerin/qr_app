import 'package:flutter/material.dart';
import 'package:qr_app/login.dart';
import 'package:qr_app/regis.dart';
import 'package:qr_app/qrp.dart';
import 'package:qr_app/profile.dart';
import 'login.dart';

void main() {
  runApp(const QrApp());
}

class QrApp extends StatefulWidget {
  const QrApp({super.key});

  @override
  State<QrApp> createState() => _QrAppState();
}

class _QrAppState extends State<QrApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn()
    );
  }
}