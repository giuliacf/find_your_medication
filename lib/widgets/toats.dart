import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:find_your_medication/main.dart';

class Toats {
  static void messages(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 7,
        backgroundColor: darkBlue,
        textColor: Colors.white,
        fontSize: 13.0);
  }
}
