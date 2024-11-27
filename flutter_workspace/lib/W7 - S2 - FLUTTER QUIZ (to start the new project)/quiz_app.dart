import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/submission.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

enum QuizState { notStarted, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  Submission submission = Submission(answer: []); // Initialize Submission object

  void changeState(QuizState newState) {
    setState(() {
      quizState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (quizState) {
      case QuizState.notStarted:
        return WelcomeScreen(
          quizTitle: widget.quiz.title, // Passing the quiz title
          onStart: () => changeState(QuizState.started),
        );
      case QuizState.started:
        return QuestionScreen(
          quiz: widget.quiz,
          onfinishQuiz: () {
            changeState(QuizState.finished); // Transition to finished
          },
        );
      case QuizState.finished:
        return ResultScreen(
          onRestart: () {
            setState(() {
              quizState = QuizState.notStarted; // Restart quiz
              submission.removeAnswer(); // Clear answers
            });
          },
          submission: submission, // Pass the submission object
          quiz: widget.quiz,
        );
      default:
        return WelcomeScreen(
          quizTitle: widget.quiz.title,
          onStart: () => changeState(QuizState.started),
        );
    }
  }
}
