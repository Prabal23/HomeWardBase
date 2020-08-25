import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:homewardbase/HomePage/HomePage.dart';
import 'package:homewardbase/MyProfilePage/MyProfilePage.dart';
import 'package:homewardbase/SecurityPage/SecurityPage.dart';

import '../main.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _projectVersion = '', _projectCode = '';
  bool isChecked = false;
  bool isChecked1 = true;
  bool isChecked2 = false;
  bool isChecked3 = true;
  bool isChecked4 = false;
  bool isChecked5 = true;
  bool isChecked6 = false;
  bool isChecked7 = true;
  bool isChecked8 = false;
  bool isChecked9 = true;
  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String projectVersion;
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    if (!mounted) return;

    setState(() {
      _projectVersion = projectVersion;
      _projectCode = projectCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 10, left: 5),
            child: Image.asset("assets/image/drawer1.png"),
            height: 25,
          ),
        ),
        title: Center(
          child: Text(
            "Notifications",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "quicksand",
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
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
          )
        ],
      ),
      drawer: new Drawer(
        child: SafeArea(
          child: Container(
            color: mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                      color: selectedColor,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/profile.png"),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(100)),
                                  height: 63,
                                  width: 63,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 15),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "John Smith",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "quicksand",
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 5),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Caseworker",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "quicksand",
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 35, left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset("assets/image/bag.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Cases",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "quicksand",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyProfilePage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset("assets/image/pp.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Profile",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "quicksand",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset("assets/image/bell.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Notifications",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "quicksand",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecurityPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child:
                                        Image.asset("assets/image/shield.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Security",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "quicksand",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child:
                                      Image.asset("assets/image/question.png"),
                                  height: 25,
                                  width: 25,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Help",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "quicksand",
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child:
                                      Image.asset("assets/image/feedback.png"),
                                  height: 25,
                                  width: 25,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Feedback",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "quicksand",
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset("assets/image/logout.png"),
                                  height: 25,
                                  width: 25,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Logout",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "quicksand",
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Privacy Policy ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "quicksand",
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "|",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "quicksand",
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Terms of Use",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "quicksand",
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "V$_projectVersion ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "quicksand",
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "|",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "quicksand",
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " © Homeardsbase, Inc",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "quicksand",
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Text(
                "When you are @mentiond",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontFamily: "quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Push Noitification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked1 = !isChecked1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked1 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Text(
                "When you are invited to join a case",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontFamily: "quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Push Noitification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked2 = !isChecked2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked2 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked3 = !isChecked3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked3 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Text(
                "When you are removed from a case",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontFamily: "quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Push Noitification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked4 = !isChecked4;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked4 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked5 = !isChecked5;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked5 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Text(
                "When someone requests to join a case",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontFamily: "quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Push Noitification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked6 = !isChecked6;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked6 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked7 = !isChecked7;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked7 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Text(
                "When someone joins a case",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontFamily: "quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Push Noitification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked8 = !isChecked8;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked8 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff777D82),
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked9 = !isChecked9;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: CustomSwitchButton(
                        buttonWidth: 36,
                        buttonHeight: 17,
                        backgroundColor:
                            !isChecked9 ? Color(0xffD8D8D8) : selectedColor,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 400),
                        checkedColor: Colors.white,
                        checked: isChecked9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 15,
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
