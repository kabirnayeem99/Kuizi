import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/backend/utilities/color_pallette.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    Key key,
    @required this.answerChoice,
    @required this.functionCall,
  }) : super(key: key);

  final String answerChoice;
  final Function functionCall;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        "$answerChoice",
        style: TextStyle(
          color: Pallette.dimWhite,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      color: Pallette.dimGrey,
      onPressed: functionCall,
    );
  }
}
