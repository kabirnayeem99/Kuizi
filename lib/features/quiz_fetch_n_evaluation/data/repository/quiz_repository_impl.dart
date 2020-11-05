import 'package:dartz/dartz.dart';
import 'package:flutter_quiz_app/core/error/failures.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/expections.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entity/quiz.dart';
import '../../domain/repository/quiz_repository.dart';
import '../datasources/quiz_local_data_source.dart';
import '../datasources/quiz_remote_data_source.dart';

class QuizRepositoryImpl implements QuizRepository {
  final NetworkInfo networkInfo;
  final QuizLocalDataSource localDataSource;
  final QuizRemoteDataSource remoteDataSource;

  QuizRepositoryImpl({
    @required this.networkInfo,
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Quiz>> getTheQuizes() async {
    if (await networkInfo.isConnected) {
      try {
        final _remoteQuizes = await remoteDataSource.getQuizes();
        localDataSource.cacheQuizes(_remoteQuizes);
        return Right(_remoteQuizes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localQuizes = await localDataSource.getLastQuizes();
        return Right(localQuizes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
