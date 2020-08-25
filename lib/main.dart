import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'SplashScreen/SplashScreen.dart';

Color mainColor = Color(0xFF003A5B);
Color subColor = Color(0xFFF6FFFC);
Color selectedColor = Color(0xFF7AE1BF);
Color unselectedColor = Color(0xFF9EC2C4);
Color itemColor = Color(0xFFf5fffb);
Color itemSelectedColor = Color(0xFFe9f9f7);
Color backColor = Color(0xFFBEF0DF);
Color progColor = Color(0xFF47AAAE);

int bottomNavIndex = 0;
int addCasePage = 1;
int menuSelected = 0;
List listLanguage = [];
List listRace = [];

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(mainColor);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
