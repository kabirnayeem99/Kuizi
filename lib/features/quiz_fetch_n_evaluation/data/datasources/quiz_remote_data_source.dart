import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/error/expections.dart';
import '../model/quiz_model.dart';

abstract class QuizRemoteDataSource {
  final http.Client client;

  QuizRemoteDataSource({@required this.client});

  Future<QuizModel> getQuizes();
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final http.Client client;

  QuizRemoteDataSourceImpl({@required this.client});

  @override
  Future<QuizModel> getQuizes() async {
    final response = await client.get(
      'https://opentdb.com/api.php?amount=10',
    );
    if (response.statusCode == 200) {
      return QuizModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
