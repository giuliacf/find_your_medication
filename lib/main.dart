import 'package:flutter/material.dart';
import 'package:find_your_medication/stores/login_store.dart';
import 'package:provider/provider.dart';
import 'screens/app_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Consulta de remédios',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryColor,
            cursorColor: primaryColor,
            scaffoldBackgroundColor: primaryColor.withAlpha(100)),
        home: AppSplashScreen(),
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Color primaryColor = hexToColor("#02587C");
Color whiteColor = hexToColor("#FEFEFE");
Color lightBlue = hexToColor("#AADEDC");
Color lightGreen = hexToColor("#5ABFAD");
Color darkBlue = hexToColor("#388A96");
Color darkGreen = hexToColor("#4B5353");
