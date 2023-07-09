import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'Start-Screen';

  List<String> selectedAnswers = [];

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'Results-Screen';
      });
    }
  }
  // @override
  // void initState() {

  //   super.initState();
  // }
  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  void refreshQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Start-Screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartPage(switchScreen);

    if (activeScreen == 'Questions-Screen') {
      screenWidget = QuestionsScreen(chooseAnswers);
    }

    if (activeScreen == 'Results-Screen') {
      screenWidget = ResultsScreen(selectedAnswers, refreshQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
