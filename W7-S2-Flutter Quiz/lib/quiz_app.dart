import 'package:flutter/material.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/model/submission.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/screens/question_screen.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/screens/result_screen.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { notStarted, started, finished }

Color appColor = Colors.blue[500] as Color;
 
class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});
  final Quiz quiz;
  
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  int currentQuestionIndex = 0;
  Submission submission = Submission();
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body:  Center(
          child: Builder(builder: (context){
            switch(quizState){
      case QuizState.notStarted:
      return WelcomeScreen(
        quizTitle: widget.quiz.title,
        onStart: (){
          setState(() {
            quizState = QuizState.started;
          });
        }
      );
      case QuizState.started:

        final currentQuestion = widget.quiz.questions[currentQuestionIndex];
        return QuestionScreen(
          question: currentQuestion,
          onFinish: (String userAnswer){
            submission.addAnswer(currentQuestion, userAnswer);
            setState(() {
              //if not the last question
              if (currentQuestionIndex < widget.quiz.questions.length - 1) {
                //move to next question
                currentQuestionIndex ++;
              } else {
              quizState = QuizState.finished;
              }
            });
          }
        );
      case QuizState.finished:
        return ResultScreen(
          submission: submission,
          quiz: widget.quiz,
          onRestart: (){
            setState(() {
              quizState = QuizState.notStarted;
              currentQuestionIndex = 0;
              submission.removeAnswer();
            });
          }
        );
  }
          })
        ),
      ),
    );
  }
}
