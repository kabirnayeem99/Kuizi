import 'package:html_unescape/html_unescape.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/quiz.dart';

class QuizModel extends Quiz {
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String rightAnswer;

  QuizModel({
    @required this.question,
    @required this.answer1,
    @required this.answer2,
    @required this.answer3,
    @required this.answer4,
    @required this.rightAnswer,
  }) : super(
          question: question,
          rightAnswer: rightAnswer,
          answer1: answer1,
          answer2: answer2,
          answer3: answer3,
          answer4: answer4,
        );

  factory QuizModel.fromJson(Map<String, dynamic> jsonDecoded) {
    var unescape = new HtmlUnescape();

    int questionNumber = 0;
    String _question =
        unescape.convert(jsonDecoded['results'][questionNumber]['question']);
    String _rightAnswer =
        jsonDecoded['results'][questionNumber]['correct_answer'];
    List<String> _wrongAnswers =
        jsonDecoded['results'][questionNumber]["incorrect_answers"];
    return QuizModel(
      question: _question,
      answer1: _wrongAnswers[0],
      answer2: _wrongAnswers[1],
      answer3: _wrongAnswers[2],
      answer4: _wrongAnswers[3],
      rightAnswer: _rightAnswer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
      'rightAnswer': rightAnswer,
    };
  }
}
