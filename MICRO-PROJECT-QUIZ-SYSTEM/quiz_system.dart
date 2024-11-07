import 'dart:io';
import 'package:collection/collection.dart';

// to support options question
abstract class Question {
  String title;
  List<String> options;
  Question(this.title, this.options);

  bool validateAnswer(List<int> selectedAnswer);
}

class SingleChoiceQuestion extends Question {
  int correctAnswer;
  SingleChoiceQuestion(super.title, super.options, this.correctAnswer);

  @override
  bool validateAnswer(List<int> selectedAnswer) {
    return selectedAnswer.length == 1 && selectedAnswer[0] == correctAnswer;
  }
}

class MultipleChoiceQuestion extends Question {
  List<int> correctAnswers;
  MultipleChoiceQuestion(super.title, super.options, this.correctAnswers);

  @override
  bool validateAnswer(List<int> selectedAnswer) {
    return const SetEquality().equals(selectedAnswer.toSet(), correctAnswers.toSet());
    // using setEquality class to do comparison of answers 
  }
}

class Participant {
  String firstName;
  String lastName;
  Participant(this.firstName, this.lastName);

  @override
  String toString() {
    return '$firstName $lastName';
  }
}

class Quiz {
  List<Question> questions = [];
  void addQuestion(Question question) {
    questions.add(question);
  }

  void startQuiz(Participant participant) {
    int score = 0;

    // to loop all questions in list
    for (var question in questions) {
      print('\n${question.title}');
      // loop all options of the question
      for (int i = 0; i < question.options.length; i++) {
        print(' ${i + 1}. ${question.options[i]}');
      }

      // Local variable to store selected answers for each question
      List<int> selectedAnswers = [];

      while (true) {
        try {
          // If the question is of type SingleChoiceQuestion
          if (question is SingleChoiceQuestion) {
            print('Enter the number of your answer: ');
            int answer = int.parse(stdin.readLineSync()!) - 1; // ! to ensure answer isn't empty // -1 to adjust to how we count (start from 0, not 1)
            selectedAnswers = [answer];
          } 
          // If the question is of type MultipleChoiceQuestion
          else if (question is MultipleChoiceQuestion) {
            print('Enter the numbers of all correct answers, separated by space: ');
            selectedAnswers = stdin.readLineSync()!
                .split(' ')
                // need to convert to int; to easily compare answers
                .map((str) => int.parse(str) - 1) // map is to transform lists 
                // parse; transform str to int, without modifying the original list
                .toList();
            // then create a list of string answers
          }
          break;
        } catch (e) {
          print('Invalid input. Please enter numbers corresponding to the options.\n');
        }
      }

      // Validate answer and provide feedback
      if (question.validateAnswer(selectedAnswers)) {
        score++;
        print('Correct!\n');
      } else {
        if (question is SingleChoiceQuestion) {
          print('Wrong! The correct answer was: ${question.options[question.correctAnswer]}\n');
        } else if (question is MultipleChoiceQuestion) {
          print('Wrong! The correct answers were: ${question.correctAnswers.map((i) => question.options[i]).join(', ')}\n');
        }
      }
    }

    print('\n${participant.toString()}, your final score is $score / ${questions.length}.');
  }
}

void main() {
  print("------ Dart Quiz ------");

  print('Enter your first name: ');
  String firstName = stdin.readLineSync()!;

  print('Enter your last name: ');
  String lastName = stdin.readLineSync()!;

  // Participants object
  Participant participant = Participant(firstName, lastName);

  Quiz quiz = Quiz();

  quiz.addQuestion(SingleChoiceQuestion(
    'In the function signature Score(a, [b], {required f});, which of the following represents a positional argument? [ Choose one ]',
    ['a', 'b', 'f'],
    0,
  ));

  quiz.addQuestion(SingleChoiceQuestion(
    'In the function signature Score(a, [b], {required f});, which of the following represents an optional positional argument? [ Choose one ]',
    ['a', 'b', 'f'],
    1,
  ));

  quiz.addQuestion(MultipleChoiceQuestion(
    'In the function signature Score(a, [b=1], {required f=0});, which of the following have default values? [ Choose two ]',
    ['a', 'b', 'f'],
    [1, 2],
  ));

  quiz.startQuiz(participant);
}
