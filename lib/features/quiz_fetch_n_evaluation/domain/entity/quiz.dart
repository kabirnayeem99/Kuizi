import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Quiz extends Equatable {
  final String question;
  final List<String> wrongAnswers;
  final String rightAnswer;

  Quiz({
    @required this.question,
    @required this.wrongAnswers,
    @required this.rightAnswer,
    List inCorrectAnswers,
  });

  @override
  List<Object> get props => [question, wrongAnswers, rightAnswer];
}
