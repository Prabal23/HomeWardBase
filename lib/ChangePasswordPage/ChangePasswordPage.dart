import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homewardbase/HomePage/HomePage.dart';

import '../main.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldpassController = new TextEditingController();
  TextEditingController newpassController = new TextEditingController();
  TextEditingController conpassController = new TextEditingController();
  bool isPressed = false;
  bool oldpassSeen = false;
  bool oldpassBlank = false;
  String oldpassword = "";

  bool newpassSeen = false;
  bool newpassBlank = false;
  String newpassword = "";

  bool conpassSeen = false;
  bool conpassBlank = false;
  String conpassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 0, left: 0),
                    child: Icon(Icons.chevron_left,
                        color: Colors.black, size: 25)),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Change Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "quicksand",
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(right: 0, left: 0),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: "quicksand",
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[],
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.15),
                  borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          oldpassword = value;
                          oldpassBlank = false;
                        });
                      },
                      controller: oldpassController,
                      obscureText: oldpassSeen ? false : true,
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
                            color: Color(0xff7A98A9),
                            fontSize: 15,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w500),
                        labelText: "Old Password",
                        contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (oldpassSeen) {
                          oldpassSeen = false;
                        } else {
                          oldpassSeen = true;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        oldpassSeen ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black38,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.15),
                  borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          newpassword = value;
                          newpassBlank = false;
                        });
                      },
                      controller: newpassController,
                      obscureText: newpassSeen ? false : true,
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
                            color: Color(0xff7A98A9),
                            fontSize: 15,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w500),
                        labelText: "New Password",
                        contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (newpassSeen) {
                          newpassSeen = false;
                        } else {
                          newpassSeen = true;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        newpassSeen ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black38,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.15),
                  borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          conpassword = value;
                          conpassBlank = false;
                        });
                      },
                      controller: conpassController,
                      obscureText: conpassSeen ? false : true,
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
                            color: Color(0xff7A98A9),
                            fontSize: 15,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w500),
                        labelText: "Confirm New Password",
                        contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (conpassSeen) {
                          conpassSeen = false;
                        } else {
                          conpassSeen = true;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        conpassSeen ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black38,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )),
          GestureDetector(
            onTap: () {
              isPressed ? null : doUpdate();
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
                            "Update password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: isPressed ? selectedColor : Colors.white,
                                fontSize: 16,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w700),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void doUpdate() {
    setState(() {
      isPressed = true;
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
