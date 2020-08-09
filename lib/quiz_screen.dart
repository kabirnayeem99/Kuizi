import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/api_providers.dart';
import 'package:flutter_quiz_app/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ApiProvider apiProvider = ApiProvider();
  Quiz aQuiz;
  String question = "Question is loading";
  String correctAnswer = "answer";
  List<dynamic> inCorrectAnswers = ["answers", "answer", "answer"];

  void getTheQuiz() {
    apiProvider.getTheQuizObject().then((aQuiz) {
      setState(() {
        question = aQuiz.question;
        correctAnswer = aQuiz.correctAnswer;
        inCorrectAnswers = aQuiz.inCorrectAnswers;
      });
    });
  }

  @override
  void initState() {
    getTheQuiz();
    super.initState();
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
          child: Column(
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
                            "$question",
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
                                "$correctAnswer",
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
                                "${inCorrectAnswers[0]}",
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
                                "${inCorrectAnswers[2]}",
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
                                "${inCorrectAnswers[1]}",
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
          ),
        ),
      ),
    );
  }
}
