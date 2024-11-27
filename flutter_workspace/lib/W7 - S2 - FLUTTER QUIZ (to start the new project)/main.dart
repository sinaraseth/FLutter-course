import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'quiz_app.dart';

void main() {
  Question q1 = const Question(
    title: "Who is the best teacher?",
    possibleAnswers: ["ronan", "hongly", 'leangsiv'],
    goodAnswer: 'ronan',
  );
  Question q2 = const Question(
    title: "Which color is the best?",
    possibleAnswers: ["blue", "red", 'green'],
    goodAnswer: 'red',
  );

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Crazy Quiz", questions: myQuestions);

  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: appColor
    ),
    home: QuizApp(quiz: myQuiz,), 
  ));
}
