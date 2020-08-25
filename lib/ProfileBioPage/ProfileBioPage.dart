import 'package:flutter/material.dart';
import 'package:homewardbase/AddCasePage/AddCasePage.dart';
import 'package:homewardbase/AddMemberPage/AddMemberPage.dart';
import 'package:homewardbase/AddNewPage/AddNewPage.dart';
import 'package:homewardbase/EventDetailsPage/EventDetailsPage.dart';
import 'package:homewardbase/HomePage/HomePage.dart';
import 'package:homewardbase/LogEntryPage/LogEntryPage.dart';
import 'package:homewardbase/LogFilterPage/LogFilterPage.dart';
import 'package:homewardbase/ProfileBioTabPages/BiographicalProfilePage/BiographicalProfilePage.dart';
import 'package:homewardbase/ProfileBioTabPages/ConnectedPeoplePage/ConnectedPeoplePage.dart';
import 'package:homewardbase/ProfileBioTabPages/ProfileChatPage/ProfileChatPage.dart';
import 'package:homewardbase/ProfileBioTabPages/ProfileEventPage/ProfileEventPage.dart';
import 'package:homewardbase/ProfileBioTabPages/ProfileLogPage/ProfileLogPage.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class ProfileBioPage extends StatefulWidget {
  @override
  _ProfileBioPageState createState() => _ProfileBioPageState();
}

class _ProfileBioPageState extends State<ProfileBioPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //menuSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8FA),
      floatingActionButton: menuSelected == 0 || menuSelected == 3
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => menuSelected == 1
                            ? AddMemberPage(2)
                            : menuSelected == 2
                                ? AddNewPage()
                                : LogEntryPage()));
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
              backgroundColor: selectedColor,
            ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(right: 0),
                            child: PopupMenuButton<int>(
                              onSelected: (selection) {
                                print("selection");
                                print(selection);
                                if (selection == 1) {
                                  _showCaseDialog(1);
                                } else {
                                  _showCaseDialog(2);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              icon: Icon(
                                Icons.more_horiz,
                                size: 25,
                                color: Colors.black,
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 1,
                                  child: Text(
                                    "Leave Case",
                                    style: TextStyle(
                                        color: Color(0xFF5A5B5C),
                                        fontFamily: 'quicksand',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  child: Text(
                                    "Close Case",
                                    style: TextStyle(
                                        color: Color(0xFF5A5B5C),
                                        fontFamily: 'quicksand',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                              offset: Offset(0, 100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                    color: Color(0xFFFFFFFF),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(left: 0),
                            child: Container(
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                  color: selectedColor,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/image/baby2.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100)),
                              height: 63,
                              width: 63,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Alannah Bradley",
                              style: TextStyle(
                                  color: mainColor,
                                  fontFamily: 'quicksand',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "Foster Placement -12 yo",
                              style: TextStyle(
                                  color: Color(0xff7A98A9),
                                  fontFamily: 'quicksand',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      menuSelected = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: menuSelected == 0
                                            ? mainColor
                                            : selectedColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 39,
                                    width: 39,
                                    child: Image.asset("assets/image/menu.png"),
                                  ),
                                ),
                                Container(
                                  child: Stack(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            menuSelected = 1;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: menuSelected == 1
                                                  ? mainColor
                                                  : selectedColor,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          height: 39,
                                          width: 39,
                                          child: Image.asset(
                                              "assets/image/user.png"),
                                        ),
                                      ),
                                      menuSelected == 1
                                          ? Container()
                                          : Container(
                                              padding: EdgeInsets.all(5),
                                              margin: EdgeInsets.only(
                                                  left: 25, bottom: 0),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFFBA0D),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              height: 20,
                                              //width: 20,
                                              // child: Center(
                                              //   child: Text(
                                              //     "0",
                                              //     style: TextStyle(
                                              //         fontFamily: 'quicksand',
                                              //         color: Color(0xffffffff),
                                              //         fontWeight:
                                              //             FontWeight.bold,
                                              //         fontSize: 8),
                                              //   ),
                                              // ),
                                              child: Icon(Icons.notifications,
                                                  size: 12,
                                                  color: Colors.white),
                                            ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      menuSelected = 2;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: menuSelected == 2
                                            ? mainColor
                                            : selectedColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 39,
                                    width: 39,
                                    child: Image.asset(
                                        "assets/image/calendar.png"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      menuSelected = 3;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: menuSelected == 3
                                            ? mainColor
                                            : selectedColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 39,
                                    width: 39,
                                    child: Image.asset("assets/image/chat.png"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      menuSelected = 4;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: menuSelected == 4
                                            ? mainColor
                                            : selectedColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 39,
                                    width: 39,
                                    child: Image.asset("assets/image/time.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ];
              },
              body: menuSelected == 0
                  ? BiographicalProfilePage()
                  : menuSelected == 1
                      ? ConnectedPeoplePage()
                      : menuSelected == 2
                          ? ProfileEventPage()
                          : menuSelected == 3
                              ? ProfileChatPage()
                              : ProfileLogPage(),
            ),
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
                        : "Do you really want to close this case? Each active case member will have up to 7 days to reject this action. ",
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
                              _showDoneDialog(1);
                            } else {
                              _showDoneDialog(2);
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
                              child: Text(number == 1 ? "Leave" : "Close",
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

  Future<Null> _showDoneDialog(number) async {
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
                    number == 1
                        ? "You have left the case"
                        : "Case pending close",
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
                        ? "You have successfully left the case and will no longer have access to it. If this was a mistake, you will have to request to join again or be invited."
                        : "This case is now pending close. All active case members will have up to 7 days to reject this action.",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
