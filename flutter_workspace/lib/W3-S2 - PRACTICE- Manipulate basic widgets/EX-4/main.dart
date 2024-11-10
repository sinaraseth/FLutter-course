import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CustumCard(textt: "OOP", color: Colors.blue[100]),
          const SizedBox(height: 20,),
          CustumCard(textt: "DART", color: Colors.blue[300]),
          const SizedBox(height: 20,),
          CustumCard(textt: "FLUTTER", color: Colors.blue[600]),
        ],
      ),
    ),
  ));
}

class CustumCard extends StatelessWidget {
  final String textt;
  final Color? color;
  const CustumCard({super.key, required this.textt, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            textt,
            style:
                const TextStyle(color: Colors.white, decoration: TextDecoration.none),
          ),
        ));
  }
}