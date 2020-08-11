import 'package:flutter_quiz_app/backend/quiz_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  String url =
      "https://opentdb.com/api.php?amount=10&category=31&difficulty=medium&type=multiple";

  Future<Quiz> getTheQuizObject(int questionNumber) async {
    var response = await http.post(url);
    Map<String, dynamic> theBody = jsonDecode(response.body);
    String question = theBody['results'][questionNumber]['question'].toString();
    String correctAnswer = theBody['results'][questionNumber]['correct_answer'];
    List<dynamic> inCorrectAnswers =
        theBody['results'][questionNumber]["incorrect_answers"];

    Quiz quiz = Quiz(
      question: question,
      correctAnswer: correctAnswer,
      inCorrectAnswers: inCorrectAnswers,
    );
    return quiz;
  }
}
