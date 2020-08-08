import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/api_providers.dart';
import 'package:flutter_quiz_app/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  OpenTrivia openTrivia = OpenTrivia();
  Quiz aQuiz;
  String question;
  String correctAnswer;
  String inCorrectAnswer1;
  String inCorrectAnswer2;
  String inCorrectAnswer3;

  Future<Quiz> getTheQuiz() async {
    aQuiz = await openTrivia.getTheQuizObject();
    question = aQuiz.question;
    correctAnswer = aQuiz.correctAnswer;
    List<String> inCorrectAnswers = aQuiz.inCorrectAnswers;
    inCorrectAnswer1 = inCorrectAnswers[0];
    inCorrectAnswer2 = inCorrectAnswers[1];
    inCorrectAnswer3 = inCorrectAnswers[2];
    print(inCorrectAnswer1);

    return aQuiz;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff616f39),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: Container(
        color: Color(0xff616f39),
        child: SafeArea(
          child: FutureBuilder(
            future: getTheQuiz(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "1 out of 10",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                question,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      color: Color(0xff252525),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                RaisedButton(
                                  child: Text(
                                    correctAnswer,
                                    style: TextStyle(
                                      color: Color(0xffdddddd),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  color: Color(0xff414141),
                                  onPressed: () => {},
                                ),
                                RaisedButton(
                                  child: Text(
                                    "incorrect answer",
                                    style: TextStyle(
                                      color: Color(0xffdddddd),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  color: Color(0xff414141),
                                  onPressed: () => {},
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                RaisedButton(
                                  child: Text(
                                    "incorrect answer",
                                    style: TextStyle(
                                      color: Color(0xffdddddd),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  color: Color(0xff414141),
                                  onPressed: () => {},
                                ),
                                RaisedButton(
                                  child: Text(
                                    "incorrect answer",
                                    style: TextStyle(
                                      color: Color(0xffdddddd),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  color: Color(0xff414141),
                                  onPressed: () => {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
