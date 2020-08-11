import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Utilities {
  static Color getRandomColor() {
    RandomColor _randomColor = RandomColor();
    Color color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.dark,
    );
    return color;
  }

  
}
