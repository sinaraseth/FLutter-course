 class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});

  get submission => null;
}

class Question {
  final String title;
  final List<String> possibleAnswers;
  final String goodAnswer;

  const Question({required this.title, required this.possibleAnswers, required this.goodAnswer});
}
