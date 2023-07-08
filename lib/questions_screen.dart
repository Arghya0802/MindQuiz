import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          currentQuestion.text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        ...currentQuestion.answers.map((answer) {
          const SizedBox(
            height: 25,
          );
          return AnswerButton(answer, () {});
        })
      ],
    );
  }
}
