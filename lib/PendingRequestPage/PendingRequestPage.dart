import 'package:flutter/material.dart';
import 'package:homewardbase/main.dart';

class PendingRequestPage extends StatefulWidget {
  @override
  _PendingRequestPageState createState() => _PendingRequestPageState();
}

class _PendingRequestPageState extends State<PendingRequestPage> {
  List potentialPeople = [
    {
      'pic': 'assets/image/pm1.png',
      'name': 'Skylar Pierce',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Caeeworker',
    },
    {
      'pic': 'assets/image/pm2.png',
      'name': 'Scott Pierce',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Caseworker',
    },
  ];

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
                    "Pending Request",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/image/pendingReq.png",
                        height: 47,
                        width: 47,
                      )),
                  GestureDetector(
                    onTap: () {
                      _showWithdrawDialog();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 14, right: 14),
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Withdrawal request",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 15, top: 0, bottom: 0),
              child: Text(
                "Pending request",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 22, right: 40, top: 10, bottom: 20),
              child: Text(
                "You have requested to join a case base on the following information.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff003A5B),
                    fontFamily: "quicksand",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              margin: EdgeInsets.only(top: 0, left: 23, right: 23),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    //spreadRadius: 5,
                    blurRadius: 1,
                    offset: Offset(0, .5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  //height: 15,
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
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
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "First Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff7A98A9),
                            fontSize: 11,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "John",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff354D5B),
                            fontSize: 11,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: 15,
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
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
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Last Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff7A98A9),
                            fontSize: 11,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Smith",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff354D5B),
                            fontSize: 11,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: 15,
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
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
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Date of Birth",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff7A98A9),
                            fontSize: 11,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "11-03-2008",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff354D5B),
                            fontSize: 11,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              margin: EdgeInsets.only(top: 20, left: 23, right: 23),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    //spreadRadius: 5,
                    blurRadius: 1,
                    offset: Offset(0, .5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Request Sent",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: mainColor,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "02-02-2020",
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
                    ],
                  ),
                ),
                Container(
                  //height: 15,
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                    thickness: 0.1,
                    //indent: 20,
                    endIndent: 0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                      children: List.generate(potentialPeople.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          //checkPotentialList.add(index);
                          if (potentialPeople[index]['checked'] == false) {
                            potentialPeople[index]['checked'] = true;
                          } else {
                            potentialPeople[index]['checked'] = false;
                          }
                        });
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 20, right: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(24),
                                    margin: EdgeInsets.only(left: 0),
                                    decoration: BoxDecoration(
                                        color: selectedColor,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "${potentialPeople[index]['pic']}"),
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
                                                      "${potentialPeople[index]['name']}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "quicksand",
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "${potentialPeople[index]['status']}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: selectedColor,
                                                        fontSize: 9,
                                                        fontFamily: "quicksand",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "${potentialPeople[index]['desc']}",
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
                                ],
                              ),
                            ),
                            potentialPeople.length - 1 == index
                                ? Container()
                                : Container(
                                    //height: 15,
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, top: 15, bottom: 15),
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
                  })),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }

  Future<Null> _showWithdrawDialog() async {
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
                      child: Image.asset("assets/image/accept_removal.png")),
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
                    "If you withdraw this request to join, you will need to make a new request or be invited.",
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
                            _showDoneDialog();
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
                              child: Text("Withdraw request",
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

  Future<Null> _showDoneDialog() async {
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
                      child: Image.asset("assets/image/reject_removal.png")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "Request withdrawn",
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
                    "Your request to join this case has been withdrawn. If you would like to join, you will need to submit another request or be invited.",
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
}
