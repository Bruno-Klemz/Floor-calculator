import 'package:flutter/material.dart';

class CustomTextInput {
  Widget buildCustomTextInput(TextEditingController controller,
      double textFieldHeight, double textFieldWidth) {
    return SizedBox(
      height: textFieldHeight,
      width: textFieldWidth,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        controller: controller,
        style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
