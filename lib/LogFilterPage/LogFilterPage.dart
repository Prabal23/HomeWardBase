import 'package:flutter/material.dart';

import '../main.dart';

class LogFilterPage extends StatefulWidget {
  @override
  _LogFilterPageState createState() => _LogFilterPageState();
}

class _LogFilterPageState extends State<LogFilterPage> {
  List typeList = [
    "Event",
    "Update",
    "Log",
  ];
  List checkedtypeList = [];
  List tagList = [
    "Visit",
    "Medical",
    "Dental",
    "Education",
    "Therapy",
    "Legal",
    "Bio",
  ];
  List checkedtagList = [];

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
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Color(0xff7A98A9),
                        fontSize: 13,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Filters",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "quicksand",
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    checkedtagList = [];
                    checkedtypeList = [];
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 0, left: 0),
                  child: Center(
                      child: Text(
                    "Reset",
                    style: TextStyle(
                        color: Color(0xff7A98A9),
                        fontSize: 13,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w400),
                  )),
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "Date Range",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.15),
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, right: 10, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Beginning",
                              style: TextStyle(
                                  color: Color(0xff354D5B),
                                  fontSize: 14,
                                  fontFamily: 'quicksand',
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                                child: Image.asset(
                              "assets/image/calendar1.png",
                              height: 17,
                              width: 17,
                            )),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.15),
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, right: 20, top: 10),
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, right: 10, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Present",
                              style: TextStyle(
                                  color: Color(0xff354D5B),
                                  fontSize: 14,
                                  fontFamily: 'quicksand',
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                                child: Image.asset(
                              "assets/image/calendar1.png",
                              height: 17,
                              width: 17,
                            )),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "Type",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Wrap(
                  children: List.generate(typeList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!checkedtypeList.contains(typeList[index])) {
                        checkedtypeList.add(typeList[index]);
                      } else {
                        checkedtypeList.remove(typeList[index]);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 17, right: 17),
                      margin: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                          color: checkedtypeList.contains(typeList[index])
                              ? selectedColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: checkedtypeList.contains(typeList[index])
                                  ? selectedColor
                                  : Color(0xfff1f1f1))),
                      child: Text(
                        "${typeList[index]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: checkedtypeList.contains(typeList[index])
                                ? Colors.white
                                : Color(0xff333333),
                            fontSize: 14,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              })),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "Tag",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Wrap(
                  children: List.generate(tagList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!checkedtagList.contains(tagList[index])) {
                        checkedtagList.add(tagList[index]);
                      } else {
                        checkedtagList.remove(tagList[index]);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 17, right: 17),
                      margin: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                          color: checkedtagList.contains(tagList[index])
                              ? selectedColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: checkedtagList.contains(tagList[index])
                                  ? selectedColor
                                  : Color(0xfff1f1f1))),
                      child: Text(
                        "${tagList[index]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: checkedtagList.contains(tagList[index])
                                ? Colors.white
                                : Color(0xff333333),
                            fontSize: 14,
                            fontFamily: "quicksand",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Wrap(
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
                      "Apply filters",
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
    );
  }
}
