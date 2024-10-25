import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text("My first flutter UI",
        style: TextStyle(
          color: Color.fromARGB(255, 255, 153, 0),
          fontSize: 50,
        ),
        ),
      ),
    ),
     ),
  );
}