import 'package:flutter/material.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:homewardbase/NotificationPage/NotificationPage.dart';
import 'package:homewardbase/SecurityPage/SecurityPage.dart';

import '../main.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _projectVersion = '', _projectCode = '';
  List<DropdownMenuItem<String>> _dropDownRoleItems;
  List arrRole = [
    "Caseworker",
  ];
  String valRole = "",
      valState = "",
      fname = "",
      lname = "",
      org = "",
      city = "",
      state = "",
      email = "",
      mobile = "",
      homeNum = "",
      officeNum = "";
  bool emailCorrect = false,
      phoneCorrect = false,
      homePhoneCorrect = false,
      officePhoneCorrect = false;
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController orgController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController mobNumController = new TextEditingController();
  TextEditingController officeNumController = new TextEditingController();
  TextEditingController homeNumController = new TextEditingController();

  @override
  initState() {
    super.initState();
    initPlatformState();
    _dropDownRoleItems = getDropDownRoleItems();
    valRole = _dropDownRoleItems[0].value;
  }

  List<DropdownMenuItem<String>> getDropDownRoleItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String roleList in arrRole) {
      items.add(new DropdownMenuItem(
          value: roleList,
          child: new Text(
            roleList,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Color(0xff000000),
                fontFamily: 'quicksand',
                fontSize: 15,
                fontWeight: FontWeight.w400),
          )));
    }
    return items;
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
      backgroundColor: Color(0xFFF8F8FA),
      //backgroundColor: selectedColor,
      appBar: AppBar(
        elevation: 0,
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
                              Navigator.pop(context);
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              color: selectedColor,
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(height:20),
                  Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/profile.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(100)),
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Container(
                            padding: EdgeInsets.all(32),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0)),
                            height: 90,
                            width: 90,
                            child: Center(
                                child:
                                    Image.asset("assets/image/photograph.png")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "John Smith",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'quicksand',
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Caseworker - CP",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.15),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 20, right: 10, top: 20),
                        padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    fname = value;
                                  });
                                },
                                //controller: oldpassController,
                                autofocus: false,
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: "Enter First Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 15,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                  labelStyle: TextStyle(
                                      color: Color(0xff959595),
                                      fontSize: 15,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                  labelText: "First Name",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.15),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 10, right: 20, top: 20),
                        padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    lname = value;
                                  });
                                },
                                //controller: oldpassController,
                                autofocus: false,
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: "Enter Last Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 15,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                  labelStyle: TextStyle(
                                      color: Color(0xff959595),
                                      fontSize: 15,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                  labelText: "Last Name",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.15),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                padding: EdgeInsets.only(top: 5, bottom: 5, right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 10, top: 5),
                      child: Text(
                        "Role",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff959595),
                            fontSize: 11.5,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: 33,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          child: DropdownButton(
                            //icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            // iconDisabledColor:
                            //     Color(0xFF008990),
                            iconEnabledColor: Color(0xff003A5B),
                            // iconSize: 40,

                            //hint: Text('Select Situation'),
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff003A5B),
                            ),
                            value: valRole,
                            items: _dropDownRoleItems,
                            icon: Icon(
                              Icons.expand_more,
                              size: 15,
                              color: Color(0xff707070),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                valRole = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              org = value;
                            });
                          },
                          controller: orgController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Enter Organization",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Organization",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              city = value;
                            });
                          },
                          controller: cityController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Enter City",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "City",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              state = value;
                            });
                          },
                          controller: orgController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Enter Organization",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "State",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                              if (email.contains('@') && email.contains(".")) {
                                emailCorrect = true;
                              } else {
                                emailCorrect = false;
                              }
                            });
                          },
                          controller: emailController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
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
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              mobile = value;
                              if (!mobile.contains(new RegExp(r'[a-zA-Z]'))) {
                                phoneCorrect = true;
                              } else {
                                phoneCorrect = false;
                              }
                            });
                          },
                          controller: mobNumController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "(---) --- ---",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Mobile",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      mobile == ""
                          ? Container()
                          : Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: phoneCorrect
                                      ? selectedColor
                                      : Colors.redAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                phoneCorrect ? Icons.done : Icons.close,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                    ],
                  )),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              officeNum = value;
                              if (!officeNum
                                  .contains(new RegExp(r'[a-zA-Z]'))) {
                                officePhoneCorrect = true;
                              } else {
                                officePhoneCorrect = false;
                              }
                            });
                          },
                          controller: orgController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "(---) --- ---",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Office",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      officeNum == ""
                          ? Container()
                          : Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: officePhoneCorrect
                                      ? selectedColor
                                      : Colors.redAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                officePhoneCorrect ? Icons.done : Icons.close,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                    ],
                  )),
            ),
            Container(
              color: Color(0xFFF8F8FA),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              homeNum = value;
                              if (!homeNum.contains(new RegExp(r'[a-zA-Z]'))) {
                                homePhoneCorrect = true;
                              } else {
                                homePhoneCorrect = false;
                              }
                            });
                          },
                          controller: homeNumController,
                          autofocus: false,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "(---) --- ---",
                            hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Home",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      homeNum == ""
                          ? Container()
                          : Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: homePhoneCorrect
                                      ? selectedColor
                                      : Colors.redAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                homePhoneCorrect ? Icons.done : Icons.close,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFF8F8FA),
        child: Wrap(
          children: <Widget>[
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 0, right: 0, top: 5),
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 0.1,
                //indent: 20,
                endIndent: 0,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: selectedColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Update",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
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
      ),
    );
  }
}
