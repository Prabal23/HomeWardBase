import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:homewardbase/CheckSlider/CheckSlider.dart';
import 'package:homewardbase/RouteAnimation/RouteAnimation.dart';
import 'package:homewardbase/WelcomePage/WelcomePage.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 250).animate(controller)
      ..addListener(() {
        setState(() {
          loadData();
          // The state that has changed here is the animation object’s value.
        });
      });

    controller.forward();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          //backgroundImage: ExactAssetImage('assets/logo.png'),

          maxRadius: 70,
          minRadius: 70,
          //radius: 68.0,
          child: Image.asset('assets/image/logo1.png'),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          child: logo,
        ),
      ),
    );
  }
}
