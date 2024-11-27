// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7 - S2 - FLUTTER QUIZ (to start the new project)/model/quiz.dart';

class Answer {
  Question question;
  String questionAnswer;

  Answer({required this.questionAnswer, required this.question});

  bool iscorrect() {
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  List<Answer> answer = [];

  Submission({required this.answer});

  int getScore() {
    int totalScore = 0;
    for (int i = 0; i < answer.length; i++) {
      if (answer[i].iscorrect()) {
        totalScore++;
      } else {
        totalScore = totalScore;
      }
    }
    return totalScore;
  }

  Answer? getAnswerFor(Question question) {
    for (int i = 0; i < answer.length; i++) {
      if (answer[i].question == question) {
        return answer[i];
      }
    }
    return null;
  }

  void addAnswer(Question question, String answerr) {
    for (int i = 0; i < answer.length; i++) {
      if (answer[i].question.title == question.title) {
        answer[i].questionAnswer = answerr;
      }
    }
  }

  void removeAnswer() {
    answer.clear();
  }
}

void main() {
  Question qu1 = const Question(
      title: "Who is Chanda?",
      possibleAnswers: [
        "Chanda is King Flutter",
        "Chanda is Ronan",
        "Chanda is JAVA"
      ],
      goodAnswer: "Chanda is King Flutter");

  Answer An1 = Answer(questionAnswer: "Chanda is King Flutter", question: qu1);
  Submission submission = Submission(answer: [An1]);

  print(An1.iscorrect());
  print("Changed");
  submission.addAnswer(qu1, "XD");
  print(An1.iscorrect());
  print(submission.getScore());
  print(submission.getAnswerFor(qu1)?.questionAnswer);
  print("After remove");
  submission.removeAnswer();
  print(submission.getAnswerFor(qu1)?.questionAnswer);
}
