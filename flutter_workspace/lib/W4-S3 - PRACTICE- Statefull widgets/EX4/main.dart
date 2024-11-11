import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScoreScreen(),
    );
  }
}

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Score Bar Example')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ScoreCard(title: "My score in Flutter"),
            SizedBox(height: 16),
            ScoreCard(title: "My score in Dart"),
            SizedBox(height: 16),
            ScoreCard(title: "My score in React"),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({super.key, required this.title});

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int _score = 1;

  void _increment() {
    if (_score < 10) {
      setState(() {
        _score++;
      });
    }
  }

  void _decrement() {
    if (_score > 1) {
      setState(() {
        _score--;
      });
    }
  }

  Color _getScoreColor(int score) {
    if (score >= 1 && score <= 3) {
      return const Color.fromARGB(255, 123, 236, 104); // Amber for scores 1 to 3
    } else if (score > 3 && score <= 7) {
      return const Color.fromARGB(255, 47, 207, 22); // Green for scores 4 to 7
    } else {
      return const Color.fromARGB(255, 21, 157, 0); // Dark green for scores 8 to 10
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrement,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: _score / 10,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: _getScoreColor(_score), // Dynamic color based on score
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _increment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
