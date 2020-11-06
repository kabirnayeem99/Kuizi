import 'package:dartz/dartz.dart';
import 'package:flutter_quiz_app/core/error/failures.dart';
import 'package:meta/meta.dart';

import '../entity/quiz.dart';
import '../repository/quiz_repository.dart';

class GetQuizList {
  final QuizRepository repository;

  GetQuizList({@required this.repository});

  Future<Either<Failure, Quiz>> call() async {
    return repository.getTheQuizes();
  }
}
