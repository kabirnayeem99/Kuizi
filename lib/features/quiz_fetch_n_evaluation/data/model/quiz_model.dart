import 'package:flutter_quiz_app/features/quiz_fetch_n_evaluation/domain/entity/quiz.dart';

import 'result_model.dart';

// class QuizModel extends Quiz {
//   final String question;
//   final String answer1;
//   final String answer2;
//   final String answer3;
//   final String answer4;
//   final String rightAnswer;

//   QuizModel({
//     @required this.question,
//     @required this.answer1,
//     @required this.answer2,
//     @required this.answer3,
//     @required this.answer4,
//     @required this.rightAnswer,
//   }) : super(
//           question: question,
//           rightAnswer: rightAnswer,
//           answer1: answer1,
//           answer2: answer2,
//           answer3: answer3,
//           answer4: answer4,
//         );

//   factory QuizModel.fromJson(Map<String, dynamic> jsonDecoded) {
//     var unescape = new HtmlUnescape();

//     int questionNumber = 0;
//     String _question =
//         unescape.convert(jsonDecoded['results'][questionNumber]['question']);
//     String _rightAnswer =
//         jsonDecoded['results'][questionNumber]['correct_answer'];
//     List<String> _wrongAnswers =
//         jsonDecoded['results'][questionNumber]["incorrect_answers"];
//     print(_question);
//     return QuizModel(
//       question: _question,
//       answer1: _wrongAnswers[0],
//       answer2: _wrongAnswers[1],
//       answer3: _wrongAnswers[2],
//       answer4: _wrongAnswers[3],
//       rightAnswer: _rightAnswer,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'question': question,
//       'answer1': answer1,
//       'answer2': answer2,
//       'answer3': answer3,
//       'answer4': answer4,
//       'rightAnswer': rightAnswer,
//     };
//   }
// }

// ignore: must_be_immutable
class QuizModel extends Quiz {
  int responseCode;
  List<ResultsModel> results;

  QuizModel({this.responseCode, this.results});

  QuizModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = new List<ResultsModel>();
      json['results'].forEach((v) {
        results.add(new ResultsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
