import 'package:flutter/material.dart';

import '../HomePage/Controller/homepage_controller.dart';

class CustomTextInput {
  Widget buildCustomTextInput(
      {required TextEditingController controller,
      required double textFieldHeight,
      required double textFieldWidth, HomePageController? homePageController}) {
    return SizedBox(
      height: textFieldHeight,
      width: textFieldWidth,
      child: TextField(
        cursorColor: const Color(0xFF16C5F0),
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF16C5F0)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF16C5F0)),
          ),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        controller: controller,
        style: const TextStyle(
            fontSize: 18.0, fontFamily: 'Roboto', color: Color(0xFF16C5F0)),
      ),
    );
  }
}
