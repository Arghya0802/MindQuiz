import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Learn Flutter the fun and right way!!',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 25),
          ),
          icon: const Icon(Icons.arrow_right_alt, size: 30),
          onPressed: startQuiz,
          label: const Text(
            'Start Quiz',
          ),
        )
      ],
    );
  }
}
