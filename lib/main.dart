import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 18, 18),
        body: Calculator(),
      ),
    ),
  );
}
