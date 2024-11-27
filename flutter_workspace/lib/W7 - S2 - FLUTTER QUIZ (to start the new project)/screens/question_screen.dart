import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7 - S2 - FLUTTER QUIZ (to start the new project)/model/quiz.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onfinishQuiz;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.onfinishQuiz,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion() {
    if (currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      widget.onfinishQuiz(); //when last question is answered finish quiz
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[currentQuestionIndex];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...question.possibleAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: const Color.fromARGB(255, 127, 185, 233),
                    foregroundColor: Colors.white, //button text color
                  ),
                  onPressed: nextQuestion,
                  child: Text(
                    answer,
                    style: const TextStyle(fontSize: 18), //button text
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
