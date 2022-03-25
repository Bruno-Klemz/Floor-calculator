import 'package:flutter/material.dart';

class CustomText {
  Text buildCustomText(
      String label, Color fontColor, double fontSize, FontWeight fontWeight) {
    return Text(
      label,
      style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontFamily: 'Roboto',
          fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
