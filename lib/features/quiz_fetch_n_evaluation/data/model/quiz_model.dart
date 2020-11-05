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

  QuizModel.fromMap(Map<String, dynamic> map, this.question, this.wrongAnswers,
      this.rightAnswer) {
    this.question = map["question"];
    this.rightAnswer = map["correct_answer"];
    this.wrongAnswers = map["incorrect_answers"];
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'wrongAnswers': wrongAnswers,
      'rightAnswer': rightAnswer,
    };
  }
}
