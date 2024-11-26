import 'package:flutter/material.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/model/quiz.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/model/submission.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/quiz_app.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/widgets/app_button.dart';
import 'result_item.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;
  
  const ResultScreen({
    super.key, 
    required this.onRestart, 
    required this.submission, 
    required this.quiz
  });

  @override
  Widget build(BuildContext context) {
    int finalScore = submission.getScore();
    int totalQuestions = quiz.questions.length;

    return Scaffold(
      backgroundColor: appColor, 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Score Text
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  'You answered $finalScore of $totalQuestions!',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // List of Questions and Results
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);
                  final userAnswer = answer?.inputAnswer ?? "No Answer";
                  final isCorrect = answer?.isCorrect() ?? false;
                  
                  return ResultItem(
                    question: question,
                    userAnswer: userAnswer,
                    isCorrect: isCorrect,
                    questionNumber: index + 1
                  );
                },
              ),
            ),

            // Restart Button
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AppButton(
                  icon: Icons.refresh, 
                  'Restart Quiz', 
                  onTap: onRestart
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
