import 'package:flutter/material.dart';

Widget getScoreButton(counter, color) {
  return Container(
    height: 50.0,
    width: 50.0,
    decoration: ShapeDecoration(
      shape: CircleBorder(side: BorderSide.none),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        "+" + counter.toString(),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    ),
  );
}
