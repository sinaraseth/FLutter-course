import 'dart:math';

import 'package:flutter/material.dart';

// const String diceImage2 = 'assets/dice-2.png';
// const String diceImage4 = 'assets/dice-4.png';

const List<String> diceimages = [
  'assets/dice-1.png',
  'assets/dice-2.png',
  'assets/dice-3.png',
  'assets/dice-4.png',
  'assets/dice-5.png',
  'assets/dice-6.png'
];

// String activeDiceImage = diceImages;
// String activeDiceImage2 = diceImage4;

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceimages[0];
  final Random random = Random();

  void rollDice() {
    setState(() {
      int randomIndex = random.nextInt(diceimages.length);
      activeDiceImage = diceimages[randomIndex];
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));
