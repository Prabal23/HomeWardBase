import 'package:flutter/material.dart';
import 'package:homewardbase/AddCasePotentialmatch/AddCasePotentialmatch.dart';
import 'package:homewardbase/NoCaseFoundPage/NoCaseFoundPage.dart';
import 'package:homewardbase/main.dart';

class AddCasePage extends StatefulWidget {
  @override
  _AddCasePageState createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  String fName = "", lName = "", dob = "";
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
                "Add a Case",
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
                "Let's see if a record already exists.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff003A5B),
                    fontFamily: "quicksand",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.15),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            fName = value;
                          });
                        },
                        controller: fNameController,
                        autofocus: false,
                        style: TextStyle(
                            color: Color(0xff003A5B).withOpacity(0.6),
                            fontSize: 15,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: "Enter First Name",
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
                          labelText: "First Name",
                          contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                          border: InputBorder.none,
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
                            lName = value;
                          });
                        },
                        controller: lNameController,
                        autofocus: false,
                        style: TextStyle(
                            color: Color(0xff003A5B).withOpacity(0.6),
                            fontSize: 15,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: "Enter Last Name",
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
                          labelText: "Last Name",
                          contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                          border: InputBorder.none,
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
                            dob = value;
                          });
                        },
                        controller: dobController,
                        autofocus: false,
                        style: TextStyle(
                            color: Color(0xff003A5B).withOpacity(0.6),
                            fontSize: 15,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: "DD-MM-YYYY",
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
                          labelText: "Date of Birth",
                          contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                )),
            GestureDetector(
              onTap: () {
                addCasePage == 1
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCasePotentialmatch()))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoCaseFoundPage()));
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
                        "Search",
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
