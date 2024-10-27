import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "OOP",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
                ),
              )),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "OOP",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
                ),
              )),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.blue[600]!,Colors.blue[900]!]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "OOP",
                style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
