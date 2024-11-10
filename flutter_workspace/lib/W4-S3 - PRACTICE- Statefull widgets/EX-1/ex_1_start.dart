import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            children: [
              SelectButton(),
              SizedBox(
                height: 10,
              ),
              SelectButton(),
              SizedBox(
                height: 10,
              ),
              SelectButton(),
              SizedBox(
                height: 10,
              ),
              SelectButton(),
            ],
          ),
        ),
      ),
    ));

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  Color color = const Color(0xffE3F2FD);
  String text = 'Not selete';
  Color textColor = Colors.black12;

  void changeButt() {
    setState(() {
      color = const Color(0xff2690ED);
      text = 'Seleted';
      textColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: changeButt,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
