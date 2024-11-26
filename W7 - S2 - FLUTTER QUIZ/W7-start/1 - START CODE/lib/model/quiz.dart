 
class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final String title;
  final List<String> answerOptions;
  final String goodAnswer;

  const Question({required this.title, required this.answerOptions, required this.goodAnswer});
}