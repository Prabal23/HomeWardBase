import 'package:flutter/material.dart';
import 'package:homewardbase/ProfileBioPage/ProfileBioPage.dart';

import '../main.dart';

class CaseCreatedPage extends StatefulWidget {
  @override
  _CaseCreatedPageState createState() => _CaseCreatedPageState();
}

class _CaseCreatedPageState extends State<CaseCreatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            //margin: EdgeInsets.only(left:55, right:55),
                            child: Center(
                                child: Image.asset(
                          "assets/image/case_created.png",
                          height: 66,
                          width: 66,
                        ))),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 30, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Case created",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: mainColor,
                                    fontFamily: "quicksand",
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 0),
                          child: Text(
                            "Now that a case has been created, it's time to add all the details and documents you have. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff354D5B),
                                fontFamily: "quicksand",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 30, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 7,
                                width: 7,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Add a profile image for the child so the case is easily recognizable ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff354D5B),
                                        fontFamily: "quicksand",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 7,
                                width: 7,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Add all information and documents to the details section ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff354D5B),
                                        fontFamily: "quicksand",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 7,
                                width: 7,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Add important dates and events to the schedule ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff354D5B),
                                        fontFamily: "quicksand",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 7,
                                width: 7,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Make sure every person who is part of the case team has been added to the case ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff354D5B),
                                        fontFamily: "quicksand",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileBioPage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 60),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Go to case",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.bold),
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
