import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/backend/utilities/color_pallette.dart';
import 'package:flutter_quiz_app/frontend/quiz_screen.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        child: Center(
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/thinking_girl.jpg"),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ),
                      ),
                    },
                    color: Pallette.attractiveRed,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Text(
                      "Have fun. Do Quiz.",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Pallette.attractiveRed,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
