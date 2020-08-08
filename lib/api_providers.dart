import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'quiz_screen.dart';

class OpenTrivia {
  String url =
      "https://opentdb.com/api.php?amount=10&category=23&difficulty=medium&type=multiple";

  Future<Quiz> getTheQuizObject() async {
    var response = await http.post(url);
    Map<String, dynamic> theBody = jsonDecode(response.body);
    String question = theBody['results'][0]['question'];
    String correctAnswer = theBody['results'][0]['correct_answer'];
    List<String> inCorrectAnswer = theBody['results'][0]['incorrect_answer'];

    Quiz quiz = Quiz(
      question: question,
      correctAnswer: correctAnswer,
      inCorrectAnswers: inCorrectAnswer,
    );
    return quiz;
  }
}
