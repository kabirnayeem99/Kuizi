import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/api_providers.dart';
import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:flutter_quiz_app/start_screen.dart';
import 'package:random_color/random_color.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

int _questionNumber = 0;

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

class _QuizScreenState extends State<QuizScreen> {
  int _counter = 0;
  ApiProvider apiProvider = ApiProvider();
  Quiz aQuiz;
  String question = "Question is loading";
  String correctAnswer = "answer";
  List<dynamic> inCorrectAnswers = ["answers", "answer", "answer"];
  Color _colorOfTheHead = getRandomColor();

  _incorrectAnswer() {
    _checkAnswer(false);
  }

  _correctAnswer() {
    _checkAnswer(true);
  }

  _checkAnswer(bool checkTest) {
    setState(
      () {
        if (_questionNumber < 10) {
          if (checkTest == true) {
            _counter++;
          }
          _questionNumber++;
          getTheQuiz();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: _counter > 8 ? DialogType.SUCCES : DialogType.ERROR,
            animType: AnimType.SCALE,
            title: _counter > 8 ? "Well done!!!" : "Need to improve.",
            desc: 'You have earned of $_counter out of 10.',
            btnOkColor: Color(0xff62a388),
            btnCancelText: "",
            btnOkIcon: Icons.restore,
            btnOkOnPress: () {
              _questionNumber = 0;
              getTheQuiz();
              _counter = 0;
            },
            btnOkText: "",
            btnCancelIcon: Icons.arrow_forward,
            btnCancelColor: Color(0xff801336),
            btnCancelOnPress: () {},
          )..show();
        }
      },
    );
  }

  void getTheQuiz() {
    apiProvider.getTheQuizObject(_questionNumber).then(
      (aQuiz) {
        setState(
          () {
            question = aQuiz.question;
            correctAnswer = aQuiz.correctAnswer;
            inCorrectAnswers = aQuiz.inCorrectAnswers;
            _colorOfTheHead = getRandomColor();
          },
        );
      },
    );
  }

  Widget getScoreButton() {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: ShapeDecoration(
        shape: CircleBorder(side: BorderSide.none),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          "+" + _counter.toString(),
          style: TextStyle(
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: _colorOfTheHead,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
                              onPressed: _correctAnswer,
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
                              onPressed: _incorrectAnswer,
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
                              onPressed: _incorrectAnswer,
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
                              onPressed: _incorrectAnswer,
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
