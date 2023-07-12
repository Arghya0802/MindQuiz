import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
// import 'package:quiz_app/quiz.dart';
// import 'package:quiz_app/start_page.dart';
// // import 'package:quiz_app/start_page.dart';
// // import 'package:quiz_app/start_page.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.refreshQuiz, {super.key});

  final List<String> chosenAnswers;
  final void Function() refreshQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    List<Map<String, Object>> summaryData = getSummary();

    var totalQuestions = questions.length;
    var correctQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return Container(
      width: 550,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(40),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'You have answered $correctQuestions out of $totalQuestions questions correctly!!',
          style: GoogleFonts.lato(
            fontSize: 21,
            color: const Color.fromARGB(255, 244, 235, 54),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        QuestionSummary(summaryData),
        const SizedBox(
          height: 40,
        ),
        TextButton.icon(
          onPressed: refreshQuiz,
          icon: const Icon(Icons.refresh),
          label: const Text(
            'Start Quiz Again',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.lato(color: Colors.white, fontSize: 20)),
        ),
      ]),
    );
  }
}
