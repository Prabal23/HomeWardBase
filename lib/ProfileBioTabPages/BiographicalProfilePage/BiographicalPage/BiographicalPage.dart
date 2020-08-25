import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homewardbase/AddPlacementPage/AddPlacementPage.dart';
import 'package:homewardbase/ProfileBioPage/ProfileBioPage.dart';

import '../../../main.dart';

class BiographicalPage extends StatefulWidget {
  @override
  _BiographicalPageState createState() => _BiographicalPageState();
}

class _BiographicalPageState extends State<BiographicalPage> {
  List games = [
    "Swimming",
    "Gaming",
    "Football",
    "Piano",
    "Baseball",
    "add_people"
  ];
  List potentialPeople = [
    {
      'pic': 'assets/image/pm1.png',
      'name': 'Skylar Pierce',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Caeeworker',
      'checked': false
    },
    {
      'pic': 'assets/image/pm2.png',
      'name': 'Scott Pierce',
      'desc': 'CPS',
      'status': 'Caseworker',
      'checked': false
    },
  ];

  List documentList = [
    // {
    //   'type': 'security',
    //   'name': 'Social Security Card',
    // },
    // {
    //   'type': 'birth',
    //   'name': 'Birth Certificate',
    // },
  ];

  List siblings = [
    {
      'fname': 'Grace',
      'confname': 'Grace',
      'lname': 'Marsh',
      'conlname': 'Marsh',
      'gender': 'Female',
      'status': 'Adoptive Placement',
      'age': '16',
      'address': '1395 Weekley Street Suite B',
      'phone': '(123) 456-7890',
      'email': 'testing@ultranesia.com',
      'notes': '--',
    },
    {
      'fname': 'Adrian',
      'confname': 'Adrian',
      'lname': 'Cook',
      'conlname': 'Cook',
      'gender': 'Male',
      'status': 'Not in Care',
      'age': '25',
      'address': '1395 Weekley Street Suite B',
      'phone': '(123) 456-7890',
      'email': 'testing@ultranesia.com',
      'notes': '--',
    },
  ];
  List kinship = [
    {
      'fname': 'William',
      'confname': 'William',
      'lname': 'Sam',
      'conlname': 'Sam',
      'gender': 'Male',
      'status': 'Adoptive Placement',
      'age': '22',
      'address': '1395 Weekley Street Suite B',
      'phone': '(123) 456-7890',
      'email': 'testing@ultranesia.com',
      'notes': '--',
    },
  ];

  List attachment = [
    "Siblingphoto.png",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
    "Casaguidelines.pdf",
  ];

  List logList = [
    {
      'pic': 'assets/image/calendar2.png',
      'log': 'An event \"CASA visit\" took place',
      'date': '10/27/20',
      'status': 'event',
      'desc': ''
    },
    {
      'pic': 'assets/image/redo.png',
      'log': 'You updated the School Name and School Address',
      'date': '10/27/20',
      'status': 'update',
      'desc': ''
    },
    {
      'pic': 'assets/image/money.png',
      'log': 'Robert Jones added to the log',
      'date': '10/27/20',
      'status': 'added',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt nulla nec rhoncus luctus. Morbi bibendum neque ut nunc accumsan, eget condimentum metus efficitur. Nullam eleifend volutpat est, a auctor nibh mollis sed. Integer sit amet purus ac diam mollis interdum ac ac metus. Etiam dictum mauris nec luctus pellentesque. '
    },
  ];

  List listData = [];

  List arrPeople = [
    "Select People From List",
  ];

  bool isEditOpen = false;
  bool isDocAvailable = false;
  bool isPlacementAvailable = false;
  bool isSiblingsAvailable = false;
  bool isKinshipAvailable = false;
  bool isinterestPressed = false;
  bool isDocumentPressed = false;
  bool isDocItemPressed = false;

  String interests = "", doc = "", path = "", valPeople = "";
  TextEditingController interestsController = new TextEditingController();
  TextEditingController docController = new TextEditingController();

  List<DropdownMenuItem<String>> _dropDownPeopleItems;

  File file;

  List<DropdownMenuItem<String>> getDropDownPeopleItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String peopleList in arrPeople) {
      items.add(new DropdownMenuItem(
          value: peopleList,
          child: new Text(
            peopleList,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: mainColor,
                fontFamily: 'quicksand',
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )));
    }
    return items;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropDownPeopleItems = getDropDownPeopleItems();
    valPeople = _dropDownPeopleItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      "Biographical",
                      style: TextStyle(
                          color: Color(0xff313131),
                          fontFamily: 'quicksand',
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        isEditOpen == false
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isEditOpen = false;
                                  });
                                },
                                child: Container(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 5, right: 5),
                                    margin: EdgeInsets.only(top: 0, right: 10),
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(color: mainColor)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontFamily: "quicksand",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isEditOpen) {
                                isEditOpen = false;
                              } else {
                                isEditOpen = true;
                              }
                            });
                          },
                          child: Container(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5),
                              margin: EdgeInsets.only(top: 0),
                              decoration: BoxDecoration(
                                  color: selectedColor,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: selectedColor)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  isEditOpen == false
                                      ? Icon(Icons.edit,
                                          size: 11, color: Colors.white)
                                      : Container(),
                                  Text(
                                    isEditOpen == false ? " Edit" : "Save",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "General",
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Date of birth",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "02-12-2015",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Place of birth",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "New york",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Languages",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "English, Spanish",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Race",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Asian",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Ethnicity",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Hispanic",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "SSN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "123-45-6789",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Activities & Interests",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                      child: Wrap(
                          children: List.generate(games.length, (index) {
                        return games[index] == "add_people"
                            ? isEditOpen == false
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      _showAddInterestsDialog();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 17,
                                            right: 17),
                                        margin: EdgeInsets.only(top: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: selectedColor)),
                                        child: Wrap(
                                          children: <Widget>[
                                            Text(
                                              "+ Add",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: selectedColor,
                                                  fontSize: 12,
                                                  fontFamily: "quicksand",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    games.removeAt(index);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 17, right: 17),
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Color(0xfff1f1f1))),
                                    child: isEditOpen == false
                                        ? Text(
                                            "${games[index]}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 12,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Wrap(
                                            children: <Widget>[
                                              Text(
                                                "${games[index]}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 12,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child:
                                                    Icon(Icons.close, size: 10),
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              );
                      })),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Documents",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontFamily: "quicksand",
                              fontWeight: FontWeight.w500),
                        ),
                        isEditOpen == false
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  _showUploadDocDialog();
                                },
                                child: Text(
                                  "+ Add Document",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: selectedColor,
                                      fontSize: 11,
                                      fontFamily: "quicksand",
                                      fontWeight: FontWeight.w500),
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
                  isDocAvailable
                      ? Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Column(
                              children:
                                  List.generate(documentList.length, (index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: index == 0 ? 0 : 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xffF5FDFA).withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Image.asset(documentList[index]
                                                ['type'] ==
                                            "security"
                                        ? "assets/image/security_card.png"
                                        : documentList[index]['type'] == "birth"
                                            ? "assets/image/birth_certificate.png"
                                            : "assets/image/google-docs.png"),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              documentList[index]['name'],
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xff060606),
                                                  fontSize: 14,
                                                  fontFamily: 'quicksand',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "View",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Color(0xff003A5B),
                                                  fontSize: 11,
                                                  fontFamily: 'quicksand',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  isEditOpen == false
                                      ? Container()
                                      : Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Text(
                                            "trash",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffF9423A),
                                                fontSize: 12,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                ],
                              ),
                            );
                          })),
                        )
                      : Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Color(0xffF5FDFA).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset("assets/image/copy.png"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "No documents have been added.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xff707070),
                                      fontSize: 14,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // isDocAvailable = true;
                                    _showUploadDocDialog();
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 70, right: 70),
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: selectedColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: selectedColor)),
                                  child: Text(
                                    "Upload",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
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
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Placement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          isEditOpen == false
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    _showPlacementDialog();
                                  },
                                  child: Container(
                                    height: 19,
                                    width: 19,
                                    child: Image.asset("assets/image/move.png"),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Placement Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "The Pierces",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "1395 Weekley Street Suite B Saint Albans, NY 11412",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Placement Type",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "Adoptive placement",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Date Palced",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "02-05-2020",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Days at Placement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "126",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Placement Phone Number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "(123) 456-7890",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Placement Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Text(
                                "testing@ultranesia.com",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff23272A),
                                    fontSize: 14,
                                    fontFamily: "quicksand",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "People at Placement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          isEditOpen == false
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    _showAddPeopleDialog();
                                  },
                                  child: Container(
                                    child: Text(
                                      "+ Add People",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: selectedColor,
                                          fontSize: 11,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      //height: 15,
                      margin: EdgeInsets.only(
                          left: 0, right: 0, top: 15, bottom: 0),
                      child: Divider(
                        color: Colors.black,
                        height: 2,
                        thickness: 0.1,
                        //indent: 20,
                        endIndent: 0,
                      ),
                    ),
                    isPlacementAvailable == false
                        ? Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 44,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5FDFA).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.asset("assets/image/idea.png"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "No people are associated with this case.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize: 14,
                                        fontFamily: 'quicksand',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPlacementAvailable = true;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 70,
                                        right: 70),
                                    margin: EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                        color: selectedColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: selectedColor)),
                                    child: Text(
                                      "Add",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                          fontFamily: "quicksand",
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                                children: List.generate(potentialPeople.length,
                                    (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    //checkPotentialList.add(index);
                                  });
                                },
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            EdgeInsets.only(left: 0, right: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(24),
                                              margin: EdgeInsets.only(left: 20),
                                              decoration: BoxDecoration(
                                                  color: selectedColor,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "${potentialPeople[index]['pic']}"),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              height: 45,
                                              width: 45,
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          20),
                                                              child: Text(
                                                                "${potentialPeople[index]['name']}",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color:
                                                                        mainColor,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        "quicksand",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    right: 30),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5,
                                                                    left: 10,
                                                                    right: 10),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                        0xffDCF7EE)
                                                                    .withOpacity(
                                                                        0.5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Text(
                                                              "${potentialPeople[index]['status']}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color:
                                                                      selectedColor,
                                                                  fontSize: 9,
                                                                  fontFamily:
                                                                      "quicksand",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      "${potentialPeople[index]['desc']}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "quicksand",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            isEditOpen == false
                                                ? Container()
                                                : Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    child: Text(
                                                      "trash",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffF9423A),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "quicksand",
                                                          fontWeight:
                                                              FontWeight.w400),
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
                            })),
                          ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Siblings",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontFamily: "quicksand",
                              fontWeight: FontWeight.w500),
                        ),
                        isEditOpen == false
                            ? Container()
                            : Text(
                                "+ Add Siblings",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: selectedColor,
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
                  isSiblingsAvailable
                      ? Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Column(
                              children: List.generate(siblings.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  //checkPotentialList.add(index);
                                });
                              },
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 0, right: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20),
                                                          child: Text(
                                                            "${siblings[index]['fname']} ${siblings[index]['lname']}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    mainColor,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    "quicksand",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  right: 30),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 10,
                                                                  right: 10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                      0xffDCF7EE)
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                            "${siblings[index]['gender']}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color:
                                                                    selectedColor,
                                                                fontSize: 9,
                                                                fontFamily:
                                                                    "quicksand",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "${siblings[index]['status']} - ${siblings[index]['age']} yo",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        fontSize: 12,
                                                        fontFamily: "quicksand",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          isEditOpen == false
                                              ? Container()
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                    "trash",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffF9423A),
                                                        fontSize: 12,
                                                        fontFamily: "quicksand",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Contact Name",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${siblings[index]['confname']} ${siblings[index]['conlname']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Address",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${siblings[index]['address']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Phone Number",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${siblings[index]['phone']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Email",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${siblings[index]['email']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Notes",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${siblings[index]['notes']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    siblings.length - 1 == index
                                        ? Container()
                                        : Container(
                                            //height: 15,
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: 15,
                                                bottom: 15),
                                            child: Divider(
                                              color: Color(0xFF000000),
                                              height: 2,
                                              thickness: 0.2,
                                              //indent: 20,
                                              endIndent: 0,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            );
                          })),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Color(0xffF5FDFA).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset("assets/image/family.png"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "No siblings are associated with this case.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xff707070),
                                      fontSize: 14,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSiblingsAvailable = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 70, right: 70),
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: selectedColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: selectedColor)),
                                  child: Text(
                                    "Add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Other Kinship",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontFamily: "quicksand",
                              fontWeight: FontWeight.w500),
                        ),
                        isEditOpen == false
                            ? Container()
                            : Text(
                                "+ Add Kinship",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: selectedColor,
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
                  isKinshipAvailable
                      ? Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Column(
                              children: List.generate(kinship.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  //checkPotentialList.add(index);
                                });
                              },
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 0, right: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20),
                                                          child: Text(
                                                            "${kinship[index]['fname']} ${kinship[index]['lname']}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    mainColor,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    "quicksand",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  right: 30),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 10,
                                                                  right: 10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                      0xffDCF7EE)
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                            "${kinship[index]['gender']}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color:
                                                                    selectedColor,
                                                                fontSize: 9,
                                                                fontFamily:
                                                                    "quicksand",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "${kinship[index]['status']} - ${kinship[index]['age']} yo",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        fontSize: 12,
                                                        fontFamily: "quicksand",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          isEditOpen == false
                                              ? Container()
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                    "trash",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffF9423A),
                                                        fontSize: 12,
                                                        fontFamily: "quicksand",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Contact Name",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${kinship[index]['confname']} ${kinship[index]['conlname']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Address",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${kinship[index]['address']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Phone Number",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${kinship[index]['phone']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Email",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${kinship[index]['email']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Notes",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff777D82),
                                                fontSize: 14,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(
                                                "${kinship[index]['notes']}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Color(0xff23272A),
                                                    fontSize: 14,
                                                    fontFamily: "quicksand",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    kinship.length - 1 == index
                                        ? Container()
                                        : Container(
                                            //height: 15,
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: 15,
                                                bottom: 15),
                                            child: Divider(
                                              color: Color(0xFF000000),
                                              height: 2,
                                              thickness: 0.2,
                                              //indent: 20,
                                              endIndent: 0,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            );
                          })),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Color(0xffF5FDFA).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset(
                                    "assets/image/play-with-child.png"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "No other kin are assisted with this case.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xff707070),
                                      fontSize: 14,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isKinshipAvailable = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 70, right: 70),
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: selectedColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: selectedColor)),
                                  child: Text(
                                    "Add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Log",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontFamily: "quicksand",
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            menuSelected = 4;
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileBioPage()));
                          },
                          child: Text(
                            "See More",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: selectedColor,
                                fontSize: 11,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //height: 15,
                    margin:
                        EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.1,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  Column(
                      children: List.generate(logList.length, (index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 10, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      margin:
                          EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 10, right: 10, bottom: 10),
                            margin:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset(
                              '${logList[index]['pic']}',
                              height: 14,
                              width: 14,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            logList[index]['status'] == "added"
                                                ? 150
                                                : 100),
                                    child: Text(
                                      "${logList[index]['log']}",
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 12,
                                          fontFamily: "quicksand",
                                          fontWeight: logList[index]
                                                      ['status'] ==
                                                  "event"
                                              ? FontWeight.w700
                                              : FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "${logList[index]['date']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff003A5B),
                                              fontSize: 12,
                                              fontFamily: "quicksand",
                                              fontWeight: FontWeight.w400),
                                        ),
                                        logList[index]['status'] == "added"
                                            ? Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      padding: EdgeInsets.only(
                                                          left: 5,
                                                          top: 5,
                                                          right: 5,
                                                          bottom: 5),
                                                      margin: EdgeInsets.only(
                                                          left: 10,
                                                          top: 0,
                                                          right: 5),
                                                      child: Image.asset(
                                                        'assets/image/feather1.png',
                                                        height: 8,
                                                        width: 8,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      padding: EdgeInsets.only(
                                                          left: 5,
                                                          top: 5,
                                                          right: 5,
                                                          bottom: 5),
                                                      margin: EdgeInsets.only(
                                                          left: 0,
                                                          top: 0,
                                                          right: 5),
                                                      child: Image.asset(
                                                        'assets/image/lesson1.png',
                                                        height: 8,
                                                        width: 8,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      padding: EdgeInsets.only(
                                                          left: 5,
                                                          top: 5,
                                                          right: 5,
                                                          bottom: 5),
                                                      margin: EdgeInsets.only(
                                                          left: 0,
                                                          top: 0,
                                                          right: 5),
                                                      child: Image.asset(
                                                        'assets/image/growth1.png',
                                                        height: 8,
                                                        width: 8,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      padding: EdgeInsets.only(
                                                          left: 5,
                                                          top: 5,
                                                          right: 5,
                                                          bottom: 5),
                                                      margin: EdgeInsets.only(
                                                          left: 0,
                                                          top: 0,
                                                          right: 5),
                                                      child: Image.asset(
                                                        'assets/image/legal.png',
                                                        height: 8,
                                                        width: 8,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      padding: EdgeInsets.only(
                                                          left: 5,
                                                          top: 5,
                                                          right: 5,
                                                          bottom: 5),
                                                      margin: EdgeInsets.only(
                                                          left: 0,
                                                          top: 0,
                                                          right: 5),
                                                      child: Image.asset(
                                                        'assets/image/teeth1.png',
                                                        height: 8,
                                                        width: 8,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      padding: EdgeInsets.only(
                                                          left: 5,
                                                          top: 5,
                                                          right: 5,
                                                          bottom: 5),
                                                      margin: EdgeInsets.only(
                                                          left: 0,
                                                          top: 0,
                                                          right: 10),
                                                      child: Image.asset(
                                                        'assets/image/stetho.png',
                                                        height: 8,
                                                        width: 8,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  logList[index]['status'] == "added"
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              top: 15, right: 10),
                                          child: Text(
                                            "${logList[index]['desc']}",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Color(0xff003A5B),
                                                fontSize: 12,
                                                fontFamily: "quicksand",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      : Container(),
                                  logList[index]['status'] == "added"
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              bottom: 0, top: 15),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics: BouncingScrollPhysics(),
                                            child: Wrap(
                                              children: List.generate(
                                                  attachment.length, (index) {
                                                return Container(
                                                  padding: EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 95,
                                                        width: 105,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffECF0F3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Container(
                                                        child: Text(
                                                          attachment[index],
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff354D5B),
                                                              fontFamily:
                                                                  "quicksand",
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  logList.length - 1 == index
                                      ? Container()
                                      : Container(
                                          //height: 15,
                                          margin: EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 20,
                                              bottom: 0),
                                          child: Divider(
                                            color: Color(0xFF000000),
                                            height: 2,
                                            thickness: 0.1,
                                            //indent: 20,
                                            endIndent: 0,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _showPlacementDialog() async {
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
                      child: Image.asset("assets/image/move.png")),
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
                    "Are you sure you want to move the child out of this placement?",
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPlacementPage()));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  top: 0, bottom: 20, left: 2.5, right: 0),
                              decoration: BoxDecoration(
                                color: selectedColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("Proceed",
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

  Future<Null> _showAddPeopleDialog() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(builder: (context, setState) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          padding: EdgeInsets.only(bottom: 10, top: 20),
                          child: Text(
                            "Add people",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'quicksand',
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.15),
                              borderRadius: BorderRadius.circular(5)),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          padding: EdgeInsets.only(top: 5, bottom: 5, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, right: 10, top: 5),
                                child: Text(
                                  "Add People",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff7A98A9),
                                      fontSize: 10,
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
                                        fontSize: 12,
                                        color: Color(0xff003A5B),
                                      ),
                                      value: valPeople,
                                      items: _dropDownPeopleItems,
                                      icon: Icon(
                                        Icons.expand_more,
                                        size: 15,
                                        color: Color(0xff707070),
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          valPeople = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 5, bottom: 10, right: 20),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listData.add({
                                      'data': '',
                                    });
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    "or invite by email",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'quicksand',
                                        color: selectedColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              listData.length == 0
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          listData.add({
                                            'data': '',
                                          });
                                        });
                                      },
                                      child: Container(
                                        child: Text(
                                          "+ Invite More",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'quicksand',
                                              color: mainColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        listData.length == 0
                            ? Container()
                            : Container(
                                child: Column(
                                  children:
                                      List.generate(listData.length, (index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.15),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 5),
                                        padding: EdgeInsets.only(
                                            top: 15, bottom: 5, right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    listData[index]['data'] =
                                                        value;
                                                  });
                                                },
                                                autofocus: false,
                                                style: TextStyle(
                                                    color: mainColor,
                                                    fontSize: 12,
                                                    fontFamily: 'quicksand',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                decoration: InputDecoration(
                                                  hintText: "Enter Email",
                                                  hintStyle: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 12,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  labelStyle: TextStyle(
                                                      color: Color(0xff7A98A9),
                                                      fontSize: 10,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  labelText: "Email",
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          12.0, 0, 12.0, 0),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  }),
                                ),
                              ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.white)),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
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
                                        top: 0,
                                        bottom: 20,
                                        left: 0,
                                        right: 2.5),
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
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          top: 0,
                                          bottom: 20,
                                          left: 2.5,
                                          right: 0),
                                      decoration: BoxDecoration(
                                        color: selectedColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text("Proceed",
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
                  ),
                );
              }));
        });
  }

  Future<Null> _showAddInterestsDialog() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(builder: (context, setState) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          padding: EdgeInsets.only(bottom: 10, top: 20),
                          child: Text(
                            "Add Activities & Interests",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'quicksand',
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.15),
                                borderRadius: BorderRadius.circular(5)),
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
                            padding:
                                EdgeInsets.only(top: 5, bottom: 5, right: 10),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        interests = value;
                                      });
                                    },
                                    controller: interestsController,
                                    autofocus: false,
                                    style: TextStyle(
                                        color: Color(0xff7A98A9),
                                        fontSize: 12,
                                        fontFamily: 'quicksand',
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      hintText: "e.g. Basketbal",
                                      hintStyle: TextStyle(
                                          color: Color(0xff7A98A9),
                                          fontSize: 12,
                                          fontFamily: 'quicksand',
                                          fontWeight: FontWeight.w500),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        isinterestPressed
                            ? Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: selectedColor)),
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 20),
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 8, bottom: 8),
                                child: SpinKitWave(
                                    color: selectedColor.withOpacity(0.5)))
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    border: Border.all(color: Colors.white)),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                              top: 0,
                                              bottom: 20,
                                              left: 0,
                                              right: 2.5),
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F8F8),
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                          setState(() {
                                            isinterestPressed = true;
                                          });
                                          Timer(Duration(seconds: 3), () {
                                            Navigator.pop(context);
                                            refresh(1);
                                          });
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                top: 0,
                                                bottom: 20,
                                                left: 2.5,
                                                right: 0),
                                            decoration: BoxDecoration(
                                              color: selectedColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text("+ Add",
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
                  ),
                );
              }));
        });
  }

  void refresh(number) {
    if (number == 1) {
      setState(() {
        isinterestPressed = false;
        games.remove("add_people");
        games.add(interests);
        games.add("add_people");
        interests = "";
        interestsController.text = "";
      });
    } else {
      setState(() {
        isDocumentPressed = false;
        documentList.add({
          'type': doc == "Social Security Card"
              ? "security"
              : doc == "Birth Ceritificate" ? "birth" : "other",
          'name': doc
        });
        doc = "";
        docController.text = "";
        path = "";
        isDocItemPressed = false;
      });
    }
  }

  Future<Null> _showUploadDocDialog() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(builder: (context, setState) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          padding: EdgeInsets.only(bottom: 10, top: 20),
                          child: Text(
                            "Upload Document",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'quicksand',
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        path == "ok"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    file = null;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 20, bottom: 20),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Color(0xffF5FDFA)
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Image.asset(doc ==
                                                "Social Security Card"
                                            ? "assets/image/security_card.png"
                                            : doc == "Birth Ceritificate"
                                                ? "assets/image/birth_certificate.png"
                                                : "assets/image/google-docs.png"),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  doc == "Social Security Card"
                                                      ? "Social Security Card"
                                                      : doc ==
                                                              "Birth Ceritificate"
                                                          ? "Birth Ceritificate"
                                                          : doc,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Color(0xff060606),
                                                      fontSize: 14,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "Remove",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      color: Color(0xff003A5B),
                                                      fontSize: 11,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w500),
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
                            : isDocItemPressed
                                ? Column(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.15),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 5,
                                              bottom: 0),
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5, right: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      doc = value;
                                                    });
                                                  },
                                                  controller: docController,
                                                  autofocus: false,
                                                  enabled: doc ==
                                                          "Social Security Card"
                                                      ? false
                                                      : doc ==
                                                              "Birth Ceritificate"
                                                          ? false
                                                          : true,
                                                  style: TextStyle(
                                                      color: Color(0xff7A98A9),
                                                      fontSize: 12,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  decoration: InputDecoration(
                                                    hintText: "Document Name",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xff7A98A9),
                                                        fontSize: 12,
                                                        fontFamily: 'quicksand',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            12.0, 0, 12.0, 0),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          //initMultiFilePickUp();
                                          setState(() {
                                            path = "ok";
                                            //isDocItemPressed = false;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.15),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 20),
                                          padding: EdgeInsets.only(
                                              top: 20, bottom: 20, right: 10),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 32,
                                                width: 32,
                                                child: Image.asset(
                                                    "assets/image/document_add.png"),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "Upload Document",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      color: Color(0xff7A98A9),
                                                      fontSize: 11,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              docController.text =
                                                  "Social Security Card";
                                              doc = "Social Security Card";
                                              isDocItemPressed = true;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15, top: 20),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffF5FDFA)
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Image.asset(
                                                      "assets/image/birth_certificate.png"),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "Social Security Card",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff060606),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'quicksand',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                            "Upload",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff003A5B),
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    'quicksand',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
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
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              docController.text =
                                                  "Birth Ceritificate";
                                              doc = "Birth Ceritificate";
                                              isDocItemPressed = true;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15, top: 20),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffF5FDFA)
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Image.asset(
                                                      "assets/image/security_card.png"),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "Birth Ceritificate",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff060606),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'quicksand',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                            "Upload",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff003A5B),
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    'quicksand',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
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
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              docController.text = "";
                                              doc = "";
                                              isDocItemPressed = true;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15, top: 20),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffF5FDFA)
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Image.asset(
                                                      "assets/image/google-docs.png"),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "Other Document",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff060606),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'quicksand',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                            "Upload",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff003A5B),
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    'quicksand',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
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
                                      ],
                                    ),
                                  ),
                        isDocumentPressed
                            ? Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: selectedColor)),
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 20),
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 8, bottom: 8),
                                child: SpinKitWave(
                                    color: selectedColor.withOpacity(0.5)))
                            : isDocItemPressed
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        border:
                                            Border.all(color: Colors.white)),
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 0),
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            //Navigator.pop(context);
                                            setState(() {
                                              isDocItemPressed = false;
                                              path = "";
                                            });
                                          },
                                          child: Container(
                                              width: 100,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 20,
                                                  left: 0,
                                                  right: 2.5),
                                              decoration: BoxDecoration(
                                                color: Color(0xffF8F8F8),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text("Cancel",
                                                  style: TextStyle(
                                                      color: Color(0xff003A5B),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          "quicksand"))),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isDocumentPressed = true;
                                                isDocAvailable = true;
                                              });
                                              Timer(Duration(seconds: 3), () {
                                                Navigator.pop(context);
                                                refresh(2);
                                              });
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    top: 0,
                                                    bottom: 20,
                                                    left: 2.5,
                                                    right: 0),
                                                decoration: BoxDecoration(
                                                  color: selectedColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text("+ Add",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "quicksand"))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                );
              }));
        });
  }

  Future initMultiFilePickUp() async {
    var filePicked = await FilePicker.getFile();
    // var file = await ImagePicker.pickImage(
    //     source: ImageSource.gallery, imageQuality: 80);
    print(filePicked);
    //path = filePicked.path;

    // if (filePicked != null) {
    //   file = filePicked;
    // }

    // setState(() {
    //   isDocItemPressed = false;
    // });
  }
}
