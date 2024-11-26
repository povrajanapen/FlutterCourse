import 'package:flutter/material.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/model/quiz.dart';


class QuestionScreen extends StatelessWidget {
  final void Function(String) onFinish;
  final Question question;
  const QuestionScreen({
    super.key,
    required this.onFinish,
    required this.question
    });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
        ),
        const SizedBox(height: 30),
        ...question.answerOptions.map((answer){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 400,
              child: 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.50),
                  ),
                  onPressed: (){
                    
                  onFinish(answer);
                  },
                  child: Text(
                    answer,
                    style: const TextStyle(fontSize: 15 ,color: Colors.white),
                    ),
                  ),
            ),
          );
        }),
        const SizedBox(height: 30),
      ],
    );
  }
}
