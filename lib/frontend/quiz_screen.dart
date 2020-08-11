import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/backend/api_providers.dart';
import 'package:flutter_quiz_app/backend/utilities/random_number.dart';
import 'package:flutter_quiz_app/backend/utilities/utilities.dart';
import 'package:flutter_quiz_app/frontend/widgets/choice_button.dart';
import 'package:flutter_quiz_app/frontend/widgets/score_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _counter = 0;
  ApiProvider _apiProvider = ApiProvider();
  String _question = "Question is loading";
  String _correctAnswer = "answer";
  List<dynamic> _inCorrectAnswers = ["answers", "answer", "answer"];
  List<dynamic> _answerList = ["answers", "answer", "answer", "answer"];
  Color _changingColor = Utilities.getRandomColor();
  int _questionNumber = 0;

  _callIncorrectAnswer() {
    _checkAnswer(false);
  }

  _callCorrectAnswer() {
    _checkAnswer(true);
  }

  _checkAnswer(bool checkTest) {
    setState(
      () {
        if (_questionNumber < 9) {
          if (checkTest == true) {
            _counter++;
          }
          _questionNumber++;
          getTheQuiz();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: _counter > 7 ? DialogType.SUCCES : DialogType.ERROR,
            animType: AnimType.SCALE,
            title: _counter > 7 ? "Well done!!!" : "Need to improve.",
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
    _apiProvider.getTheQuizObject(_questionNumber).then(
      (aQuiz) {
        setState(
          () {
            _question = aQuiz.question;
            _correctAnswer = aQuiz.correctAnswer;
            _inCorrectAnswers = aQuiz.inCorrectAnswers;
            _answerList = [
              _inCorrectAnswers[0],
              _inCorrectAnswers[1],
              _inCorrectAnswers[2],
              _correctAnswer
            ];
            _changingColor = Utilities.getRandomColor();
          },
        );
      },
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
        title: Center(
          child: Text(
            " ${_questionNumber + 1} out of 10",
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: _changingColor,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.restore,
              color: Colors.white,
            ),
            onPressed: () {
              _questionNumber = 0;
              getTheQuiz();
              _counter = 0;
            },
          ),
        ],
      ),
      body: Container(
        color: _changingColor,
        child: SafeArea(
          child: Column(
            children: [
              questionPart(
                _changingColor,
                _counter,
                _question,
              ),
              multipleChoicePart(
                RandomNumber.shuffle(_answerList),
                _correctAnswer,
                _callCorrectAnswer,
                _callIncorrectAnswer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget questionPart(color, counter, question) {
  return Expanded(
    child: Container(
      color: color,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            getScoreButton(
              counter,
              color,
            ),
            Flexible(
              child: SizedBox(
                height: 10.0,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Flexible(
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
            ),
          ],
        ),
      ),
    ),
  );
}

Widget multipleChoicePart(
  List<dynamic> answerList,
  String correctAnswer,
  Function callCorrectAnswer,
  Function callIncorrectAnswer,
) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      color: Color(0xff252525),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ChoiceButton(
                  answerChoice: answerList[0],
                  functionCall: answerList[0] == correctAnswer
                      ? callCorrectAnswer
                      : callIncorrectAnswer,
                ),
                ChoiceButton(
                  answerChoice: answerList[1],
                  functionCall: answerList[1] == correctAnswer
                      ? callCorrectAnswer
                      : callIncorrectAnswer,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ChoiceButton(
                  answerChoice: answerList[2],
                  functionCall: answerList[2] == correctAnswer
                      ? callCorrectAnswer
                      : callIncorrectAnswer,
                ),
                ChoiceButton(
                  answerChoice: answerList[3],
                  functionCall: answerList[3] == correctAnswer
                      ? callCorrectAnswer
                      : callIncorrectAnswer,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
