import 'package:flutter/material.dart';

import '../main.dart';
import 'custom_texts.dart';

class CustomColumnInfos extends StatelessWidget {
  CustomColumnInfos({this.title, this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTexts(
          text: title,
          textColor: lightBlue,
          fontWeight: FontWeight.bold,
          size: 14,
        ),
        CustomTexts(
          text: info,
          textColor: whiteColor,
          fontWeight: FontWeight.normal,
          size: 22,
        ),
      ],
    );
  }
}
