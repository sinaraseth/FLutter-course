import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7 - S2 - FLUTTER QUIZ (to start the new project)/model/quiz.dart';
import 'package:flutter_workspace/W7 - S2 - FLUTTER QUIZ (to start the new project)/model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestart;

  // Constructor to receive quiz, submission, and onRestart callback
  const ResultScreen({
    Key? key,
    required this.quiz,
    required this.submission,
    required this.onRestart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();
    int totalQuestions = quiz.questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quiz score
            Text(
              'Quiz Score: $score / $totalQuestions',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // List of questions with answers
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);
                  final isCorrect = answer != null && answer.iscorrect();
                  return ListTile(
                    title: Text(
                      'Question ${index + 1}: ${question.title}',
                      style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Answer: ${answer?.questionAnswer ?? 'No Answer'}',
                      style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    leading: Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),

            // Restart button
            Center(
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
