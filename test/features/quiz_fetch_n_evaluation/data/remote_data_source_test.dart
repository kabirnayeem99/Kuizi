import 'dart:convert';

import 'package:flutter_quiz_app/features/quiz_fetch_n_evaluation/data/datasources/quiz_remote_data_source.dart';
import 'package:flutter_quiz_app/features/quiz_fetch_n_evaluation/data/model/quiz_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock implements QuizRemoteDataSource {}

class MockQuizModel extends Mock implements QuizModel {}

class MockHttpClient extends Mock implements http.Client {}

main() {
  MockHttpClient mockHttpClient;
  MockRemoteDataSource mockRemoteDataSource;
  MockQuizModel mockQuizModel;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockRemoteDataSource = MockRemoteDataSource();
    mockQuizModel = MockQuizModel();
  });

  test(
    'should return json file if the connection is successful',
    () async {
      //arrange
      when(mockRemoteDataSource.getQuizes()).thenAnswer(
          (realInvocation) async =>
              QuizModel.fromJson(json.decode(fixture('quiz.json'))));
      //act
      final result = await mockRemoteDataSource.getQuizes();
      //assert
      final expected =
          await QuizModel.fromJson(json.decode(fixture('quiz.json')));
      expect(result, expected);
    },
  );
}
