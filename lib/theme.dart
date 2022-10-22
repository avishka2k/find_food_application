import 'package:flutter/material.dart';

abstract class AppColors {
  static const secondary = Color.fromARGB(255, 0, 119, 255);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
  static const primaryColor = Color.fromARGB(206, 26, 25, 25);
}


abstract class myTextStyle {
  static const title = TextStyle(fontSize: 25, fontWeight: FontWeight.w600);
  static const cardName = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const cardStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  static const createQrName =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

}