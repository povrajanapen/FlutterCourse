import 'package:flutter/material.dart';
import 'package:test/W7-S2-FLUTTERQUIZ/lib/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;

  const WelcomeScreen(
      {super.key, required this.onStart, required this.quizTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            "assets/quiz/quiz-logo.png",
          ),
        ),
        const SizedBox(height: 10),
        Text(
          quizTitle,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 30),
        AppButton(icon: Icons.arrow_right_alt, 'Start quiz!', onTap: onStart),
      ],
    );
  }
}
