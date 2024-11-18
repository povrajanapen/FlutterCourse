import 'dart:io';
import 'dart:convert';
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
    return const SetEquality()
        .equals(selectedAnswer.toSet(), correctAnswers.toSet());
    // using SetEquality class to do comparison of answers
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

class Result {
  Participant participant;
  int score;
  int totalQuestions;

  Result(this.participant, this.score, this.totalQuestions);

}

class Quiz {
  List<Question> questions = [];
  // create a list that store object type of Question
  void addQuestion(Question question) {
    //object of subclass
    questions.add(question);
  }

  int startQuiz(Participant participant) {
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
            int answer = int.parse(stdin.readLineSync()!) -
                1; // ! to ensure answer isn't empty // -1 to adjust to how we count (start from 0, not 1)
            selectedAnswers = [answer];
          }
          // If the question is of type MultipleChoiceQuestion
          else if (question is MultipleChoiceQuestion) {
            print(
                'Enter the numbers of all correct answers, separated by space: ');
            selectedAnswers = stdin
                .readLineSync()!
                .split(' ')
                // need to convert to int; to easily compare answers
                .map((str) => int.parse(str) - 1) // map is to transform lists
                // parse; transform str to int, without modifying the original list
                .toList();
            // then create a list of answers
          }
          break;
        } catch (e) {
          print(
              'Invalid input. Please enter numbers corresponding to the options.\n');
        }
      }

      // Validate answer and provide feedback
      if (question.validateAnswer(selectedAnswers)) {
        score++;
        print('Correct!\n');
      } else {
        if (question is SingleChoiceQuestion) {
          print(
              'Wrong! The correct answer was: ${question.options[question.correctAnswer]}\n');
        } else if (question is MultipleChoiceQuestion) {
          print(
              'Wrong! The correct answers were: ${question.correctAnswers.map((i) => question.options[i]).join(', ')}\n');
        }
      }
    }
    return score;
  }
}

class FileManager {
  final String filePath;

  FileManager(this.filePath);

  void saveResults(List<Result> results) {
    try {
      Map<String, Map<String, dynamic>> resultsMap = {};
      for (var result in results) {
        String key = '${result.participant.firstName} ${result.participant.lastName}';
        resultsMap[key] = {
          'score': result.score,
          'totalQuestions': result.totalQuestions
        };
      }
      File file = File(filePath);
      file.writeAsStringSync(jsonEncode(resultsMap));
      print('Results have been saved to $filePath.');
    } catch (e) {
      print('Error saving results: $e');
    }
  }

  List<Result> loadResults() {
    try {
      File file = File(filePath);
      if (file.existsSync()) {
        String fileContents = file.readAsStringSync();
        Map<String, dynamic> resultsJson = jsonDecode(fileContents);

        List<Result> results = [];
        resultsJson.forEach((key, value) {
          String firstName = key.split(' ')[0];
          String lastName = key.split(' ')[1];
          int score = value['score'];
          int totalQuestions = value['totalQuestions'];

          Participant participant = Participant(firstName, lastName);
          results.add(Result(participant, score, totalQuestions));
        });
        print('Previous results loaded from $filePath.');
        return results;
      } else {
        print('No previous results found.');
        return [];
      }
    } catch (e) {
      print('Error loading results: $e');
      return [];
    }
  }
}


class QuizManager {
  List<Result> results = [];
  List<Quiz> quizzes = [];
  FileManager fileManager = FileManager('MICRO-project/lib/quiz_result1.json');

  void loadResults() {
    results = fileManager.loadResults();
  }

  void run() {
    Participant participant = _promptParticipantInfo();

    while (true) {
      print('\n======================');
      print('1. Take a quiz');
      print('2. View your results');
      print('3. Quit');
      print('======================');
      stdout.write('>> Choose an option: ');
      String? choice = stdin.readLineSync();

      if (choice == '1') {
        _takeQuiz(participant);
      } else if (choice == '2') {
        _showResults(participant);
      } else if (choice == '3') {
        print('Goodbye, ${participant.toString()}');
        break;
      } else {
        print('Invalid option, Please try again.');
      }
    }
  }

  Participant _promptParticipantInfo() {
    print('Enter your first name: ');
    String firstName = stdin.readLineSync()!;
    print('Enter your last name: ');
    String lastName = stdin.readLineSync()!;
    return Participant(firstName, lastName);
  }

  void _takeQuiz(Participant participant) {
    Quiz quiz = Quiz();

    // Add questions
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
      'In the function signature Score(a, [b=1], {required f=0});, which of the following have default value? [ Choose two ]',
      ['a', 'b', 'f'],
      [1, 2],
    ));

    int score = quiz.startQuiz(participant);
    results.add(Result(participant, score, quiz.questions.length));
    print(
        '\n${participant.toString()}, your final score is $score out of ${quiz.questions.length}.');

    fileManager.saveResults(results);
  }

  void _showResults(Participant participant) {
    print('\n== Quiz Results for "${participant.toString()}" ==');

    var userResults = results
        .where(
          (result) =>
              result.participant.firstName == participant.firstName &&
              result.participant.lastName == participant.lastName,
        )
        .toList();

    if (userResults.isEmpty) {
      print('No previous results found for ${participant.toString()}.');
    } else {
      for (var result in userResults) {
        print(
            '> "${result.participant.toString()}" score ${result.score} out of ${result.totalQuestions}.');
      }
    }
  }

  
}

void main() {
  QuizManager quizManager = QuizManager();
  quizManager.loadResults();
  quizManager.run();
}
