import 'package:flutter/material.dart';
import 'package:homewardbase/YourProfilePage/YourProfilePage.dart';

import '../../main.dart';

class ConnectedPeoplePage extends StatefulWidget {
  @override
  _ConnectedPeoplePageState createState() => _ConnectedPeoplePageState();
}

class _ConnectedPeoplePageState extends State<ConnectedPeoplePage> {
  List currentPeople = [
    {
      'pic': 'assets/image/cp1.png',
      'name': 'Lois Hughes',
      'desc': 'CPS',
      'status': 'Caseworker'
    },
    {
      'pic': 'assets/image/cp2.png',
      'name': 'Leon Campbell',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Caseworker'
    },
    {
      'pic': 'assets/image/cp3.png',
      'name': 'Jordan Jones',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Foster Parent'
    },
    {
      'pic': 'assets/image/cp4.png',
      'name': 'Demi Webb',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Foster Parent'
    },
  ];

  List pendingPeople = [
    {
      'pic': 'assets/image/cp1.png',
      'name': 'Philippa Jordan',
      'desc': 'CPS',
      'status': 'Foster Parent',
      'itemStatus': 'Pending Add',
    },
    {
      'pic': 'assets/image/cp2.png',
      'name': 'Adriana Bailey',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Caseworker',
      'itemStatus': 'Pending Removal',
    },
  ];

  List formerPeople = [
    {
      'pic': 'assets/image/cp1.png',
      'name': 'Adriana Bailey',
      'desc': 'SandalWood',
      'status': 'Foster Parent',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Color(0xFFF8F8FA),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        "Current",
                        style: TextStyle(
                            color: Color(0xff313131),
                            fontFamily: 'quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        children: List.generate(currentPeople.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YourProfilePage()));
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15, right: 5),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(24),
                                      decoration: BoxDecoration(
                                          color: selectedColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${currentPeople[index]['pic']}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      height: 45,
                                      width: 45,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Text(
                                                        "${currentPeople[index]['name']}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "quicksand",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5, right: 30),
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10,
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffDCF7EE)
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "${currentPeople[index]['status']}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: selectedColor,
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "quicksand",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "${currentPeople[index]['desc']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 12,
                                                  fontFamily: "quicksand",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(0),
                                      margin: EdgeInsets.only(right: 0),
                                      child: PopupMenuButton<int>(
                                        onSelected: (selected) {
                                          _showRemoveRejectDialog(1);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Color(0xff707070)
                                              .withOpacity(0.3),
                                        ),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 1,
                                            child: Text(
                                              "Remove",
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
                              currentPeople.length - 1 == index
                                  ? Container()
                                  : Container(
                                      //height: 15,
                                      margin: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 15,
                                          bottom: 15),
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
                    }))),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        "Pending",
                        style: TextStyle(
                            color: Color(0xff313131),
                            fontFamily: 'quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        children: List.generate(pendingPeople.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YourProfilePage()));
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15, right: 5),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(24),
                                      decoration: BoxDecoration(
                                          color: selectedColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${pendingPeople[index]['pic']}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      height: 45,
                                      width: 45,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Text(
                                                        "${pendingPeople[index]['name']}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "quicksand",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5, right: 30),
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10,
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffDCF7EE)
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "${pendingPeople[index]['status']}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: selectedColor,
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "quicksand",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${pendingPeople[index]['desc']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 12,
                                                  fontFamily: "quicksand",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(0),
                                      margin: EdgeInsets.only(right: 0),
                                      child: PopupMenuButton<int>(
                                        onSelected: (selected) {
                                          if (pendingPeople[index]
                                                  ['itemStatus'] ==
                                              "Pending Add") {
                                            if (selected == 2) {
                                              _showRemoveRejectDialog(2);
                                            } else {
                                              _showAcceptCancelDialog(1);
                                            }
                                          } else {
                                            _showAcceptCancelDialog(2);
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Color(0xff707070)
                                              .withOpacity(0.3),
                                        ),
                                        itemBuilder: (context) => pendingPeople[
                                                    index]['itemStatus'] ==
                                                "Pending Add"
                                            ? [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: Text(
                                                    "Accept",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5A5B5C),
                                                        fontFamily: 'quicksand',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  value: 2,
                                                  child: Text(
                                                    "Reject",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5A5B5C),
                                                        fontFamily: 'quicksand',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ]
                                            : [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: Text(
                                                    "Cancel Removal",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5A5B5C),
                                                        fontFamily: 'quicksand',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                        offset: Offset(0, 100),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 70),
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 14, right: 14),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "${pendingPeople[index]['itemStatus']}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontFamily: "quicksand",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              pendingPeople.length - 1 == index
                                  ? Container()
                                  : Container(
                                      //height: 15,
                                      margin: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 15,
                                          bottom: 5),
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
                    }))),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        "Former",
                        style: TextStyle(
                            color: Color(0xff313131),
                            fontFamily: 'quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 90),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        children: List.generate(formerPeople.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YourProfilePage()));
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15, right: 5),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(24),
                                      decoration: BoxDecoration(
                                          color: selectedColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${formerPeople[index]['pic']}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      height: 45,
                                      width: 45,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Text(
                                                        "${formerPeople[index]['name']}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "quicksand",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5, right: 30),
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10,
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffDCF7EE)
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "${formerPeople[index]['status']}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: selectedColor,
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "quicksand",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${formerPeople[index]['desc']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 12,
                                                  fontFamily: "quicksand",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              formerPeople.length - 1 == index
                                  ? Container()
                                  : Container(
                                      //height: 15,
                                      margin: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 15,
                                          bottom: 5),
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
                    }))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _showRemoveRejectDialog(number) async {
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
                          ? "assets/image/delete.png"
                          : "assets/image/unsuccess.png")),
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
                        ? "Do you really want to remove amanda kennedy from the case? Amanda will be notified and can reject this action."
                        : "Do you really want to reject philippa jordan's request to join this case?",
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
                              child: Text(number == 1 ? "Remove" : "Reject",
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

  Future<Null> _showAcceptCancelDialog(number) async {
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
                          : "assets/image/delete.png")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    number == 1 ? "Success" : "Removal canceled",
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
                        : "Removal was successfully canceled.",
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
