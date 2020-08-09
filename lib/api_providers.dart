// import 'package:flutter_quiz_app/quiz_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// const apiKey = "Jqmpdmpehg5vQiRr5kqyieVr8FCY8Yro00nWSDtj";

// class ApiProvider {
//   String question;
//   String correctAnswer;
//   List<String> inCorrectAnswers;
//   Future<Quiz> getTheQuizObject() async {
//     var params = {
//       'apiKey': apiKey,
//       'limit': '10',
//       'category': 'Linux',
//       'difficulty': 'easy',
//     };
//     var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

//     var response = await http.post('https://opentdb.com/api.php?amount=10');
//     var responseBody = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       question = responseBody[0]["question"];
//       correctAnswer = responseBody['results'][0]['correct_answer'];
//       inCorrectAnswers = responseBody['results'][0]['incorrect_answers'];
//       print(responseBody);
//     } else {
//       question = "Question is loading";
//       correctAnswer = "answer1";
//       inCorrectAnswers = ["answer2", "answer3", "answer4"];
//     }
//     Quiz quiz = Quiz(
//       question: question,
//       correctAnswer: correctAnswer,
//       inCorrectAnswers: inCorrectAnswers,
//     );
//     return quiz;
//   }
// }

import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  String url =
      "https://opentdb.com/api.php?amount=1&category=23&difficulty=medium&type=multiple";

  Future<Quiz> getTheQuizObject() async {
    var response = await http.post(url);
    Map<String, dynamic> theBody = jsonDecode(response.body);
    String question = theBody['results'][0]['question'].toString();
    String correctAnswer = theBody['results'][0]['correct_answer'];
    List<dynamic> inCorrectAnswers = theBody['results'][0]["incorrect_answers"];

    Quiz quiz = Quiz(
      question: question,
      correctAnswer: correctAnswer,
      inCorrectAnswers: inCorrectAnswers,
    );
    return quiz;
  }
}
