import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;

  SizeConfig(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
    widthMultiplier = blockSizeHorizontal;
  }
}