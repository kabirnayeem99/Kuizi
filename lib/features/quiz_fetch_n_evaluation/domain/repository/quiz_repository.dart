import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entity/quiz.dart';

abstract class QuizRepository {
  Future<Either<Failure, Quiz>> getTheQuizes();
}
