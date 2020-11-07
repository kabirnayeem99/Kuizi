import 'package:meta/meta.dart';

class Results {
  String question;
  String correctAnswer;
  List<String> allAnswers;

  Results({
    @required this.question,
    @required this.correctAnswer,
    @required this.allAnswers,
  });

  Results.fromJson(Map<String, dynamic> jsonDecoded) {
    question = jsonDecoded['question'];
    correctAnswer = jsonDecoded['correct_answer'];
    allAnswers = jsonDecoded['incorrect_answers'].cast<String>();
    allAnswers.add(correctAnswer);
    allAnswers.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.allAnswers;
    return data;
  }
}
