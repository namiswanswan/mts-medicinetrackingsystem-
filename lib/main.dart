import 'package:flutter/material.dart';
import 'package:realme/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'medi',
      home: Login(),
      debugShowCheckedModeBanner: false, // Set debug banner to false
    );
  }
}