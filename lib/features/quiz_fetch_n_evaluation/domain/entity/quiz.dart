import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Quiz extends Equatable {
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String rightAnswer;

  Quiz({
    @required this.question,
    @required this.answer1,
    @required this.answer2,
    @required this.answer3,
    @required this.answer4,
    @required this.rightAnswer,
  });

  @override
  List<Object> get props => [
        question,
        answer1,
        answer2,
        answer3,
        answer4,
        rightAnswer,
      ];
}
