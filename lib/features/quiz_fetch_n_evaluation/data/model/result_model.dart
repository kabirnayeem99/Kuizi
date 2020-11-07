import 'package:flutter_quiz_app/features/quiz_fetch_n_evaluation/domain/entity/result.dart';
import 'package:meta/meta.dart';

// ignore: must_be_immutable
class ResultsModel extends Results {
  String question;
  String correctAnswer;
  List<String> allAnswers;

  ResultsModel({
    @required this.question,
    @required this.correctAnswer,
    @required this.allAnswers,
  });

  ResultsModel.fromJson(Map<String, dynamic> jsonDecoded) {
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
