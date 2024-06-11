import 'package:flutter/material.dart';

class TextsStyles {
  static const titleXL = TextStyle(
      color: Color.fromARGB(255, 249, 245, 255),
      shadows: [
        Shadow(
          blurRadius: 10.0, // shadow blur
          color: Color.fromARGB(147, 0, 0, 0), // shadow color
          offset: Offset(1.4, 1.4), // how much shadow will be shown
        ),
      ],
      fontFamily: 'Maven',
      fontSize: 50,
      fontWeight: FontWeight.w400);
  static const titleMD = TextStyle(
      color: Color.fromARGB(255, 249, 245, 255),
      fontFamily: 'Maven',
      fontSize: 40,
      fontWeight: FontWeight.w400);
  static const titleSM = TextStyle(
      color: Color.fromARGB(255, 249, 245, 255),
      fontFamily: 'Maven',
      fontSize: 20,
      fontWeight: FontWeight.w700);
  static const content = TextStyle(
      color: Color.fromARGB(255, 249, 245, 255),
      fontFamily: 'Maven',
      fontSize: 18,
      fontWeight: FontWeight.w700);
  static const contentSM = TextStyle(
      color: Color.fromARGB(255, 249, 245, 255),
      fontFamily: 'Maven',
      fontSize: 14,
      letterSpacing: -0.5,
      fontWeight: FontWeight.w700);
}
