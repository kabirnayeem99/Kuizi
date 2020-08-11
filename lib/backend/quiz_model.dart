class Quiz {
  String question;
  String correctAnswer;
  List<dynamic> inCorrectAnswers;

  Quiz({
    this.question,
    this.correctAnswer,
    this.inCorrectAnswers,
  });

  Quiz.fromMap(Map<String, dynamic> map) {
    this.question = map["question"];
    this.correctAnswer = map["correct_answer"];
    this.inCorrectAnswers = map["incorrect_answers"];
  }
}
