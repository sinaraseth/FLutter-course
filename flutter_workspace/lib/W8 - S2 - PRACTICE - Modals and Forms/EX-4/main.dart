import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8 - S2 - PRACTICE - Modals and Forms/EX-4/screen/device_converter.dart';
 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 252, 115, 47),
                Color.fromARGB(255, 201, 79, 17),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const DeviceConverter(),
        ),
      ),
    ));
}
