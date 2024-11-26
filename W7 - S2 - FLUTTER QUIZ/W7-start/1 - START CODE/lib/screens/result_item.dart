import 'package:flutter/material.dart';
import '../model/quiz.dart';


class ResultItem extends StatelessWidget {
final Question question;
final String userAnswer;
final bool isCorrect;
final int questionNumber;

const ResultItem({
super.key,
required this.question,
required this.userAnswer,
required this.isCorrect,
required this.questionNumber
});

@override
Widget build(BuildContext context) {
return Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  child: Column(
    
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //question indicator
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            child: Text(
              '$questionNumber',
              style: const TextStyle(color: Colors.white),
            ),
          ),
            const SizedBox(width: 12),

          //question title
          Expanded(
            child: Text(
              question.title,
              style: 
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),

      //display all answers
      const SizedBox(height: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: question.answerOptions.map((option){
          bool isCorrect = option == question.goodAnswer;
          bool isUserAnswer = option == userAnswer;

      return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            SizedBox(
            width: 40,  
            child: isCorrect ? const Icon( Icons.check, color: Colors.green, size: 20): null, 
          ),

        Expanded(
          child: Text(
            option,
            style: 
            TextStyle(
              fontSize: 16,
              color: isCorrect ? Colors.green
              : (isUserAnswer ? Colors.red : Colors.black),
            ),
            textAlign: TextAlign.start,
          ),
        ),

          ],
        ),
      );
      
    }).toList(),
  ),

],
),
);
}
}

