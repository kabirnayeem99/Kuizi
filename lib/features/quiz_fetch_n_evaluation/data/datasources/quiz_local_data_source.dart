import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/expections.dart';
import '../model/quiz_model.dart';

abstract class QuizLocalDataSource {
  Future<QuizModel> getLastQuizes();
  Future<void> cacheQuizes(QuizModel quizToCache);
}

const CACHED_QUIZ = 'CACHED_QUIZ';

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  final SharedPreferences sharedPreferences;

  QuizLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheQuizes(QuizModel quizToCache) {
    final _encodedJson = json.encode(quizToCache.toJson());
    return sharedPreferences.setString(CACHED_QUIZ, _encodedJson);
  }

  @override
  Future<QuizModel> getLastQuizes() {
    final jsonString = sharedPreferences.getString(CACHED_QUIZ);

    if (jsonString != null) {
      QuizModel _quizmodel = QuizModel.fromJson(json.decode(jsonString));
      return Future.value(_quizmodel);
    } else {
      throw CacheException();
    }
  }
}
