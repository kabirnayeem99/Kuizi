import 'package:flutter/material.dart';
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

  checkAnswer() {
    setState(
      () {
        if (_questionNumber < 10) {
          _questionNumber++;
          getTheQuiz();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        }
        if (true) {
          _counter++;
        }
      },
    );
  }

  // CustomBgAlertBox customBgAlertBox() {
  //   return CustomBgAlertBox(
  //     context: context,
  //     title: "Stop!!!",
  //     buttonText: "Go back",
  //     infoMessage: "Your exam has come to an end",
  //     icon: Icons.warning,
  //     bgColor: Color(0xffdddddd),
  //     titleTextColor: Color(0xff111111),
  //     messageTextColor: Color(0xff111111),
  //     buttonColor: Color(0xff414141),
  //     buttonTextColor: Color(0xffdddddd),
  //   );
  // }

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTheQuiz();

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
                              onPressed: checkAnswer,
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
                              onPressed: checkAnswer,
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
                              onPressed: checkAnswer,
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
                              onPressed: checkAnswer,
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
