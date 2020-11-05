import 'package:meta/meta.dart';

import '../../domain/entity/quiz.dart';

// ignore: must_be_immutable
class QuizModel extends Quiz {
  var question;
  var wrongAnswers;
  var rightAnswer;

  QuizModel({
    @required this.question,
    @required this.wrongAnswers,
    @required this.rightAnswer,
  }) : super(
            question: question,
            rightAnswer: rightAnswer,
            wrongAnswers: wrongAnswers);

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: 'question',
      wrongAnswers: ['wrongAnswers'],
      rightAnswer: 'rightAnswer',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'wrongAnswers': wrongAnswers,
      'rightAnswer': rightAnswer,
    };
  }
}
