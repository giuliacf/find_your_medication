import 'package:flutter/material.dart';

class CustomTexts extends StatelessWidget {
  CustomTexts(
      {this.size, this.text, this.fontWeight, this.textColor, this.textAlign});

  final double size;
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(fontSize: size, fontWeight: fontWeight, color: textColor),
        textAlign: textAlign);
  }
}
