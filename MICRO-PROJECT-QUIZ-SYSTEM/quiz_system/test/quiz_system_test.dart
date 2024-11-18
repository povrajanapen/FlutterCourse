import 'dart:io';
import 'package:collection/collection.dart';

// Base class for Question
abstract class Question {
  String title;
  List<String> options;

  Question(this.title, this.options);

  bool validateAnswer(List<int> selectedAnswers);
}

// Single choice question
class SingleChoiceQuestion extends Question {
  int correctAnswer;

  SingleChoiceQuestion(String title, List<String> options, this.correctAnswer)
      : super(title, options);

  @override
  bool validateAnswer(List<int> selectedAnswers) {
    return selectedAnswers.length == 1 && selectedAnswers[0] == correctAnswer;
  }
}

// Multiple choice question
class MultipleChoiceQuestion extends Question {
  List<int> correctAnswers;

  MultipleChoiceQuestion(String title, List<String> options, this.correctAnswers)
      : super(title, options);

  @override
  bool validateAnswer(List<int> selectedAnswers) {
    return const ListEquality().equals(selectedAnswers, correctAnswers);
  }
}

// Participant class to hold participant information
class Participant {
  String firstName;
  String lastName;

  Participant(this.firstName, this.lastName);

  String get fullName => '$firstName $lastName'; // Computed property for full name
}

// Result class to hold quiz result information
class Result {
  Participant participant;
  int score;
  int totalQuestions;

  Result(this.participant, this.score, this.totalQuestions);

  void displayResult() {
    print('\n${participant.fullName}, your final score: $score / $totalQuestions');
  }
}

// Quiz class to handle the questions and scoring
class Quiz {
  List<Question> questions = [];

  void addQuestion(Question question) {
    questions.add(question);
  }

  Result startQuiz(Participant participant) {
    int score = 0;

    for (var question in questions) {
      print('\n${question.title}');
      for (int i = 0; i < question.options.length; i++) {
        print('  ${i + 1}. ${question.options[i]}');
      }

      if (question is SingleChoiceQuestion) {
        print('Enter the number of your answer: ');
        int answer = int.parse(stdin.readLineSync()!) - 1;
        if (question.validateAnswer([answer])) score++;
      } else if (question is MultipleChoiceQuestion) {
        print('Enter the numbers of all correct answers, separated by spaces: ');
        List<int> answers = stdin.readLineSync()!
            .split(' ')
            .map((str) => int.parse(str) - 1)
            .toList();
        if (question.validateAnswer(answers)) score++;
      }
    }

    // Create a Result object and display the result
    Result result = Result(participant, score, questions.length);
    result.displayResult();
    return result; // Optionally return the result object if needed
  }
}

void main() {
  // Get participant's first and last name
  print('Enter your first name: ');
  String firstName = stdin.readLineSync()!;
  
  print('Enter your last name: ');
  String lastName = stdin.readLineSync()!;
  
  // Create a Participant object
  Participant participant = Participant(firstName, lastName);

  Quiz quiz = Quiz();

  // Add sample questions (2 single-choice and 2 multiple-choice)
  quiz.addQuestion(SingleChoiceQuestion(
    'What is the primary difference between final and const in Dart?',
    ['final variables can be reassigned; const variables cannot.', 
    'final variables are initialized at runtime; const variables are initialized at compile time.',
     'Both can be changed at any time.', 
     'const variables can be reassigned; final variables cannot.'],
    1,
  ));

  quiz.addQuestion(SingleChoiceQuestion(
    'Which of the following correctly declares a constant variable in Dart?',
    ['final int age = 30;', 
    'const int age = 30;',
    'var age = 30;', 
    'int age = 30;'],
    1,
  ));

  quiz.addQuestion(MultipleChoiceQuestion(
    'Which statements are true regarding final variables in Dart? (Select all that apply)',
    ['hey must be initialized at the time of declaration.',
     'They can be assigned values at runtime.',
     'They can only hold primitive data types.',
     'They cannot be reassigned after their initial value is set.'],
    [1, 3],
  ));

  quiz.addQuestion(MultipleChoiceQuestion(
    'Which of the following can be declared as const in Dart? (Select all that apply)',
    ["const List<int> numbers = [1, 2, 3];",
    "const Map<String, String> countries = {'USA': 'United States', 'UK': 'United Kingdom'};",
    "const int a = 10;",
    "const String name = 'Ronan';"],
    [0, 1, 2, 3],
  ));

  // Start the quiz with the participant
  quiz.startQuiz(participant);
}