import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:homewardbase/ForgetPasswordPage/ForgetPasswordPage.dart';
import 'package:homewardbase/HomePage/HomePage.dart';
import 'package:homewardbase/RegisterPage/RegisterPage.dart';
import 'package:homewardbase/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  bool emailCorrect = false;
  bool passSeen = false;
  bool isPressed = false;
  bool emailBlank = false;
  bool passBlank = false;
  String email = "", password = "", passwordTxt = "";
  double st = 0.0, end = 13.0;
  double minValue = 0.0;
  double maxValue = 25.0;
  double _lowerValue = 50;
  double _upperValue = 180;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = "demo@mail.com";
    password = "123456";
    passwordTxt = "Password field is blank";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.chevron_left, color: Colors.black, size: 35))),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(15),
                  child: Image.asset("assets/image/small_logo.png")),
              Container(
                margin: EdgeInsets.only(left: 20, right: 15, top: 0, bottom: 0),
                child: Text(
                  "Welcome back,",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "quicksand",
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 22, right: 40, top: 10, bottom: 40),
                child: Text(
                  "Log in to access Homewardbase.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff003A5B),
                      fontFamily: "quicksand",
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 20, top: 0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                              emailBlank = false;
                              if (email.contains('@') && email.contains(".")) {
                                emailCorrect = true;
                              } else {
                                emailCorrect = false;
                              }
                            });
                          },
                          controller: emailController,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Color(0xff003A5B).withOpacity(0.6),
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            hintText: "abc@xyz.com",
                            hintStyle: TextStyle(
                                color: Color(0xff003A5B).withOpacity(0.6),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w600),
                            labelStyle: TextStyle(
                                color: Color(0xff003A5B),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w500),
                            labelText: "Email",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      email == ""
                          ? Container()
                          : Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: emailCorrect
                                      ? selectedColor
                                      : Colors.redAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                emailCorrect ? Icons.done : Icons.close,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                    ],
                  )),
              Container(
                //height: 15,
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Divider(
                  color: Colors.black,
                  height: 2,
                  thickness: 0.15,
                  //indent: 20,
                  endIndent: 0,
                ),
              ),
              emailBlank
                  ? Container(
                      margin: EdgeInsets.only(
                          left: 22, right: 20, top: 5, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.redAccent,
                            size: 14,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "Email field is blank",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontFamily: "quicksand",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 15, top: 15),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                              passBlank = false;
                            });
                          },
                          controller: passController,
                          obscureText: passSeen ? false : true,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff003A5B).withOpacity(0.6),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            hintText: "XXXXXXX",
                            hintStyle: TextStyle(
                                color: Color(0xff003A5B).withOpacity(0.6),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w600),
                            labelStyle: TextStyle(
                                color: Color(0xff003A5B),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w500),
                            labelText: "Password",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (passSeen) {
                              passSeen = false;
                            } else {
                              passSeen = true;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            passSeen ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black38,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                //height: 15,
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Divider(
                  color: Colors.black,
                  height: 2,
                  thickness: 0.15,
                  //indent: 20,
                  endIndent: 0,
                ),
              ),
              passBlank
                  ? Container(
                      margin: EdgeInsets.only(
                          left: 22, right: 20, top: 5, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.redAccent,
                            size: 14,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                passwordTxt,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontFamily: "quicksand",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordPage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  margin:
                      EdgeInsets.only(left: 22, right: 20, top: 25, bottom: 0),
                  child: Text(
                    "Forgot Password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "quicksand",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  isPressed ? null : doLogin();
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                        color: isPressed ? Colors.white : selectedColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: selectedColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        isPressed
                            ? Container(
                                height: 20,
                                child: SpinKitWave(
                                    color: selectedColor.withOpacity(0.5)))
                            : Container(),
                        isPressed
                            ? Container()
                            : Text(
                                "Sign in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: isPressed
                                        ? selectedColor
                                        : Colors.white,
                                    fontSize: 16,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w700),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 22, right: 20, top: 5, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "quicksand",
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        " Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: selectedColor,
                            fontFamily: "quicksand",
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: FlutterSlider(
              //     //handlerWidth: 15,
              //     tooltip: FlutterSliderTooltip(
              //       //alwaysShowTooltip: true,
              //       // leftPrefix: Icon(
              //       //   Icons.account_circle,
              //       //   size: 19,
              //       //   color: Colors.black45,
              //       // ),
              //       // rightSuffix: Icon(
              //       //   Icons.attach_money,
              //       //   size: 19,
              //       //   color: Colors.black45,
              //       // ),
              //       disabled: true,
              //     ),
              //     handlerAnimation: FlutterSliderHandlerAnimation(
              //         curve: Curves.elasticOut,
              //         reverseCurve: Curves.bounceIn,
              //         duration: Duration(milliseconds: 500),
              //         scale: 1.5),
              //     trackBar: FlutterSliderTrackBar(
              //       activeTrackBarHeight: 3,
              //       inactiveTrackBar: BoxDecoration(color: Color(0xffDCF7EE)),
              //       activeTrackBar: BoxDecoration(
              //           borderRadius: BorderRadius.circular(4),
              //           color: selectedColor),
              //     ),
              //     jump: true,
              //     handler: FlutterSliderHandler(
              //       decoration: BoxDecoration(),
              //       child: Material(
              //           type: MaterialType.canvas,
              //           color: Colors.transparent,
              //           elevation: 0,
              //           child: Container(
              //               child: Image.asset("assets/image/slider.png"))),
              //     ),
              //     rightHandler: FlutterSliderHandler(
              //       decoration: BoxDecoration(),
              //       child: Material(
              //           type: MaterialType.canvas,
              //           color: Colors.transparent,
              //           elevation: 0,
              //           child: Container(
              //               child: Image.asset("assets/image/slider.png"))),
              //     ),
              //     values: [0, 13],
              //     min: 0,
              //     max: 25,
              //     rangeSlider: true,
              //     onDragging: (handlerIndex, lowerValue, upperValue) {
              //       print(lowerValue);
              //       print(upperValue);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void doLogin() {
    setState(() {
      isPressed = true;
    });

    if (emailController.text == "") {
      setState(() {
        emailBlank = true;
        isPressed = false;
      });
    } else if (passController.text == "") {
      setState(() {
        passBlank = true;
        isPressed = false;
      });
    } else if (emailController.text != "demo@mail.com" ||
        passController.text != "123456") {
      setState(() {
        passBlank = true;
        isPressed = false;
        passwordTxt = "Username or password does not match";
      });
    } else {
      setState(() {
        emailBlank = false;
        passBlank = false;
      });

      Timer(Duration(seconds: 3), () {
        setState(() {
          isPressed = false;
        });

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }

  customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 23,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1))
          ],
        ),
      ),
    );
  }
}
