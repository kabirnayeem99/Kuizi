import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Results extends Equatable {
  final String question;
  final String correctAnswer;
  final List<String> allAnswers;

  Results({
    @required this.question,
    @required this.correctAnswer,
    @required this.allAnswers,
  });

  @override
  List<Object> get props => [question, correctAnswer, allAnswers];
}
