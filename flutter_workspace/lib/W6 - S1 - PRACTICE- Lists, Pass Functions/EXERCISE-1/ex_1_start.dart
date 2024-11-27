import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (var i = 0; i < colors.length; i++) Text(colors[i]),

            const Label("Method 2: Map", bold: true),
            ...colors.map((item) => Text(item)),
            
            const Label("Method 23: Dedicated Function", bold: true),
            ...getColors(),
          ],
        ),
      ),
    ),
  ));
}

List<Widget> getColors() {
  return colors.map((item) => Text(item)).toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}


  // Q1- In what scenarios might one approach be more advantageous than another?
  // ->  Using a Dedicated Function is have more advantageous than another 
  //     because using Map also function it make the code more clean and with good 
  //     performance