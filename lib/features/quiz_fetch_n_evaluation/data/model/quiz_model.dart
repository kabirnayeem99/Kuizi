import 'package:html_unescape/html_unescape.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/quiz.dart';

class QuizModel extends Quiz {
  final String question;
  final List<String> wrongAnswers;
  final String rightAnswer;

  QuizModel({
    @required this.question,
    @required this.wrongAnswers,
    @required this.rightAnswer,
  }) : super(
            question: question,
            rightAnswer: rightAnswer,
            wrongAnswers: wrongAnswers);

  factory QuizModel.fromJson(Map<String, dynamic> jsonDecoded) {
    var unescape = new HtmlUnescape();

    int questionNumber = 0;
    String _question =
        unescape.convert(jsonDecoded['results'][questionNumber]['question']);
    String _rightAnswer =
        jsonDecoded['results'][questionNumber]['correct_answer'];
    List<dynamic> _wrongAnswers =
        jsonDecoded['results'][questionNumber]["incorrect_answers"];
    return QuizModel(
      question: _question,
      wrongAnswers: _wrongAnswers,
      rightAnswer: _rightAnswer,
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
