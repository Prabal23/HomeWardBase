import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get_version/get_version.dart';
import 'package:homewardbase/AddCasePage/AddCasePage.dart';
import 'package:homewardbase/CasesPages/CasesPages.dart';
import 'package:homewardbase/FilterPage/FilterPage.dart';
import 'package:homewardbase/MyProfilePage/MyProfilePage.dart';
import 'package:homewardbase/NotificationPage/NotificationPage.dart';
import 'package:homewardbase/PendingRequestPage/PendingRequestPage.dart';
import 'package:homewardbase/ProfileBioPage/ProfileBioPage.dart';
import 'package:homewardbase/SecurityPage/SecurityPage.dart';
import 'package:homewardbase/YourProfilePage/YourProfilePage.dart';
import 'package:homewardbase/main.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _projectVersion = '', _projectCode = '';

  List initList = [
    {
      'fname': 'Alannah',
      'lname': 'Bradley',
      'proPic': 'assets/image/baby2.png',
      'status': 'Foster Placement',
      'age': '12',
      'boa': true,
    },
    {
      'fname': 'Alannah',
      'lname': 'Bradley',
      'proPic': null,
      'status': 'Pending',
      'age': '12',
      'boa': false,
    },
    {
      'fname': 'Jakub',
      'lname': 'Palmer',
      'proPic': 'assets/image/baby1.png',
      'status': 'Adoptive Placement',
      'age': '12',
      'boa': false,
    },
  ];

  bool isPendingClose = false;

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
    FlutterStatusbarcolor.setStatusBarColor(selectedColor);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF8F8FA),
      appBar: AppBar(
        backgroundColor: selectedColor,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 10, left: 5),
            child: Image.asset("assets/image/drawer.png"),
            height: 25,
          ),
        ),
        title: Center(
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
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset("assets/image/search.png"),
                  height: 25,
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FilterPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset("assets/image/filter.png"),
                    height: 25,
                    width: 25,
                  ),
                ),
              ],
            ),
          ),
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
                              Navigator.pop(context);
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationPage()));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCasePage()));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: selectedColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                  children: List.generate(initList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    initList[index]['status'] == 'Pending'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PendingRequestPage()))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileBioPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        initList[index]['proPic'] == null
                            ? Container(
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(100)),
                                height: 45,
                                width: 45,
                                child: Center(
                                    child: Text(
                                  "${initList[index]['fname'][0]}${initList[index]['lname'][0]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "quicksand",
                                      fontWeight: FontWeight.w600),
                                )),
                              )
                            : Container(
                                padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${initList[index]['proPic']}"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(100)),
                                height: 45,
                                width: 45,
                              ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "${initList[index]['fname']} ${initList[index]['lname']}",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 15,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                initList[index]['status'] == 'Pending'
                                    ? Container(
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 14,
                                            right: 14),
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "${initList[index]['status']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: "quicksand",
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Text(
                                          "${initList[index]['status']} - ${initList[index]['age']} yo",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: mainColor,
                                              fontSize: 12,
                                              fontFamily: "quicksand",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        initList[index]['boa']
                            ? Container(
                                margin: EdgeInsets.only(right: 5, left: 0),
                                //child: Image.asset("assets/image/boa.png"),
                                height: 23,
                                width: 23,
                                child: Icon(
                                  Icons.notifications,
                                  size: 18,
                                  color: Color(0xffFFBA0D),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                );
              })),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
              //padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Pending Removal",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 15,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Jill Smith has suggested that you be removed from this case.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showCaseDialog(1);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5, right: 7.5),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 14, right: 14),
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Accept removal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showRemovalDialog(2);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5, left: 7.5),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 14, right: 14),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF9423A),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Reject removal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "3 days left to respond",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 8,
                          fontFamily: "quicksand",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    //height: 15,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.15,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileBioPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 10),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/baby3.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                            height: 33,
                            width: 33,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Liliana Hudson",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor.withOpacity(0.6),
                                          fontSize: 10,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Adoptive Placement - 10 yo",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 8,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
              //padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Pending Close",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 15,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Jill Smith has suggested that this case be closed.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isPendingClose == false
                      ? Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _showCaseDialog(2);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5, right: 7.5),
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 14,
                                        right: 14),
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Accept close",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 5, left: 7.5),
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 14, right: 14),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF9423A),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Reject close",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      isPendingClose ? "3 days left" : "3 days left to respond",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 8,
                          fontFamily: "quicksand",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    //height: 15,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.15,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileBioPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 10),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/baby3.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                            height: 33,
                            width: 33,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Liliana Hudson",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor.withOpacity(0.6),
                                          fontSize: 10,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Adoptive Placement - 10 yo",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 8,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
              //padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "New Member Request",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 15,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Jill Smith has requested to join this case",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourProfilePage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 10),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/baby4.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                            height: 33,
                            width: 33,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Abigail Miles",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor.withOpacity(0.6),
                                          fontSize: 10,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "Foster Parent",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: mainColor,
                                              fontSize: 8,
                                              fontFamily: "quicksand",
                                              fontWeight: FontWeight.w500),
                                        ),
                                        // Text(
                                        //   " - 12 yo",
                                        //   textAlign: TextAlign.start,
                                        //   overflow: TextOverflow.ellipsis,
                                        //   style: TextStyle(
                                        //       color: mainColor,
                                        //       fontSize: 8,
                                        //       fontFamily: "quicksand",
                                        //       fontWeight: FontWeight.w500),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showMemberDialog(1);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5, right: 7.5),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 14, right: 14),
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Accept request",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showMemberDialog(2);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5, left: 7.5),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 14, right: 14),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF9423A),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Reject request",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //height: 15,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.15,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileBioPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 10),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/baby3.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                            height: 33,
                            width: 33,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Liliana Hudson",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor.withOpacity(0.6),
                                          fontSize: 10,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Adoptive Placement - 10 yo",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 8,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _showCaseDialog(number) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(number == 1
                          ? "assets/image/accept_removal.png"
                          : "assets/image/accept_close.png")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "Are you sure?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff003A5B),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Text(
                    number == 1
                        ? "Do you really want to leave this case? You will not be able to join again without requesting to join."
                        : "You are agreeing to close this case. You will not be able to change your response.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff7A98A9),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                top: 0, bottom: 20, left: 0, right: 2.5),
                            decoration: BoxDecoration(
                              color: Color(0xffF8F8F8),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: Color(0xff003A5B),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "quicksand"))),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            if (number == 1) {
                              _showRemovalDialog(1);
                            } else {
                              _showCloseDialog(1);
                            }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  top: 0, bottom: 20, left: 2.5, right: 0),
                              decoration: BoxDecoration(
                                color: Color(0xffF9423A),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(number == 1 ? "Leave" : "Accept",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "quicksand"))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _showRemovalDialog(number) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(number == 1
                          ? "assets/image/accept_removal.png"
                          : "assets/image/reject_removal.png")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    number == 1 ? "You have left the case" : "Reject Removal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff003A5B),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Text(
                    number == 1
                        ? "You have successfully left the case and will no longer have access to it. If this was a mistake, you will have to request to join again or be invited."
                        : "Removal rejected” as the header, and “You are still part of this case. Check with Jill Smith to see if your removal suggestion was made by mistake.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff7A98A9),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white)),
                    child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: 0, bottom: 20, left: 50, right: 50),
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: "quicksand"))),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _showCloseDialog(number) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(number == 1
                          ? "assets/image/accept_close.png"
                          : "assets/image/unsuccess.png")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    number == 1 ? "Case pending close" : "New member rejected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff003A5B),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: Text(
                    number == 1
                        ? "This case is now pending close. All active case members will have up to 7 days to reject this action."
                        : "You have successfully rejected Jill Smith's attempt to join this case. They will have to request again to join or be invited if this was a mistake.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff7A98A9),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      isPendingClose = true;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        border: Border.all(color: Colors.white)),
                    child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: 0, bottom: 20, left: 50, right: 50),
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: "quicksand"))),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _showMemberDialog(number) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(number == 1
                          ? "assets/image/success.png"
                          : "assets/image/unsuccess.png")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    number == 1 ? "Success" : "New member rejected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff003A5B),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: Text(
                    number == 1
                        ? "Philippa Jordan has been successfully added to this case"
                        : "You have successfully rejected Jill Smith's attempt to join this case. They will have to request again to join or be invited if this was a mistake.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff7A98A9),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        border: Border.all(color: Colors.white)),
                    child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: 0, bottom: 20, left: 30, right: 30),
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: "quicksand"))),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
