import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(50.0),
      margin: const EdgeInsets.all(40.0),
      color: Colors.blue[300],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: const Center(
          child: Text(
            "CADT STUDENTS",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), decoration: TextDecoration.none, fontSize: 30),
          ),
        ),
      ),
    ),
  ));
}
