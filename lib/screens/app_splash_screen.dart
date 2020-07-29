import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:find_your_medication/screens/login_screen.dart';

import '../main.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (__) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor.withAlpha(100),
      child: Image.asset('images/splashScreen.png'),
    );
  }
}
