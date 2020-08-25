import 'package:flutter/material.dart';
import 'package:homewardbase/AddMemberPage/AddMemberPage.dart';

import '../main.dart';

class NoCaseFoundPage extends StatefulWidget {
  @override
  _NoCaseFoundPageState createState() => _NoCaseFoundPageState();
}

class _NoCaseFoundPageState extends State<NoCaseFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 0, left: 0),
              child: Icon(Icons.chevron_left, color: Colors.black, size: 25)),
        ),
        title: Center(
          child: Text(
            "Add a Case",
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
            child: Icon(Icons.ac_unit),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.all(20),
                child: Image.asset(
                  "assets/image/addcase.png",
                  height: 44,
                )),
            Container(
              margin: EdgeInsets.only(left: 20, right: 15, top: 0, bottom: 0),
              child: Text(
                "No case found",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 22, right: 40, top: 10, bottom: 40),
              child: Text(
                "It doesn't look like we could locate a case that matched that information.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff003A5B),
                    fontFamily: "quicksand",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20, right: 20),
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
              margin: EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
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
              padding: EdgeInsets.only(left: 20, right: 20),
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
              margin: EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
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
              padding: EdgeInsets.only(left: 20, right: 20),
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
            Container(
              //height: 15,
              margin: EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddMemberPage(1)));
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
                        "Create case",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
