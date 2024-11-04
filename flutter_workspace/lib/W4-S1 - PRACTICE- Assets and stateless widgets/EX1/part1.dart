import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(Icons.travel_explore),
                    ),
                    Text(
                      'Travelling',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
