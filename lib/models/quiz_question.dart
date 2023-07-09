class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffledAnswers() {
    List<String> shuffledList = List.of(answers);

    shuffledList.shuffle();

    return shuffledList;
  }
}
