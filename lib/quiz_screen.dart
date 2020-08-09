import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/api_providers.dart';
import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:random_color/random_color.dart';

Color getRandomColor() {
  RandomColor _randomColor = RandomColor();
  Color color = _randomColor.randomColor(
    colorBrightness: ColorBrightness.dark,
  );
  return color;
}

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

enum ScoreWidgetStatus {
  HIDDEN,
  BECOMING_VISIBLE,
  VISIBLE,
  BECOMING_INVISIBLE,
}

class _QuizScreenState extends State<QuizScreen> {
  int _counter = 0;
  ApiProvider apiProvider = ApiProvider();
  Quiz aQuiz;
  String question = "Question is loading";
  String correctAnswer = "answer";
  List<dynamic> inCorrectAnswers = ["answers", "answer", "answer"];
  Color _colorOfTheHead = getRandomColor();

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getTheQuiz() {
    apiProvider.getTheQuizObject().then((aQuiz) {
      setState(() {
        question = aQuiz.question;
        correctAnswer = aQuiz.correctAnswer;
        inCorrectAnswers = aQuiz.inCorrectAnswers;
        _colorOfTheHead = getRandomColor();
      });
    });
  }

  Widget getScoreButton() {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: new ShapeDecoration(
        shape: new CircleBorder(side: BorderSide.none),
        color: Colors.white,
      ),
      child: new Center(
        child: new Text(
          "+" + _counter.toString(),
          style: new TextStyle(
            color: _colorOfTheHead,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
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
        backgroundColor: _colorOfTheHead,
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
        color: _colorOfTheHead,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: _colorOfTheHead,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      children: [
                        getScoreButton(),
                        Flexible(
                          child: SizedBox(
                            height: 10.0,
                          ),
                        ),
                        // Text(
                        //   "$counter",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 16.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "$question",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
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
                              onPressed: _incrementCounter,
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
