import 'package:flutter/material.dart';
import 'package:homewardbase/ProfileBioPage/ProfileBioPage.dart';

import '../../../main.dart';

class DentalPage extends StatefulWidget {
  @override
  _DentalPageState createState() => _DentalPageState();
}

class _DentalPageState extends State<DentalPage> {
  List doctorList = [
    {
      'pic': 'assets/image/d3.png',
      'name': 'Nicole Byrne',
      'address': '83 Hall Lane West Warwick, RI 02893',
      'phone': '985-951-6167',
      'status': 'Dentist'
    },
    {
      'pic': 'assets/image/d4.png',
      'name': 'Owen Brooks',
      'address': '891 North Strawberry Road Dedham, MA 02026',
      'phone': '225-506-3342',
      'status': ' Orthodontist,'
    },
  ];

  List consitionList = [
    {
      'name': 'Sensitive Teeth',
      'instruction': 'Needs toothpaste for sensitive teeth.',
      'date': '02-20-2020',
    },
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

  bool isDentalEdit = false;

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
                      "Dental",
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
                        isDentalEdit == false
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDentalEdit = false;
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
                              if (isDentalEdit) {
                                isDentalEdit = false;
                              } else {
                                isDentalEdit = true;
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
                                  isDentalEdit == false
                                      ? Icon(Icons.edit,
                                          size: 11, color: Colors.white)
                                      : Container(),
                                  Text(
                                    isDentalEdit == false ? " Edit" : "Save",
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
                          "Dental Care Providers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontFamily: "quicksand",
                              fontWeight: FontWeight.w500),
                        ),
                        isDentalEdit == false
                            ? Container()
                            : Text(
                                "+ Add Dental Care Providers",
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
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Column(
                        children: List.generate(doctorList.length, (index) {
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
                                padding: EdgeInsets.only(left: 0, right: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(24),
                                      margin: EdgeInsets.only(left: 20),
                                      decoration: BoxDecoration(
                                          color: selectedColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${doctorList[index]['pic']}"),
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
                                                        "${doctorList[index]['name']}",
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
                                                      "${doctorList[index]['status']}",
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
                                            SizedBox(height: 7),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 15,
                                                    color: mainColor,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${doctorList[index]['address']}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          color: mainColor,
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
                                            SizedBox(height: 7),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.phone_android,
                                                    size: 13,
                                                    color: mainColor,
                                                  ),
                                                  Text(
                                                    "${doctorList[index]['phone']}",
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    isDentalEdit == false
                                        ? Container()
                                        : Container(
                                            margin: EdgeInsets.only(right: 10),
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
                              ),
                              doctorList.length - 1 == index
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
                          "Conditions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontFamily: "quicksand",
                              fontWeight: FontWeight.w500),
                        ),
                        isDentalEdit == false
                            ? Container()
                            : Text(
                                "+ Add Conditions",
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
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Column(
                        children: List.generate(consitionList.length, (index) {
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
                                padding: EdgeInsets.only(left: 0, right: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Text(
                                                        "${consitionList[index]['name']}",
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
                                                        top: 5, right: 10),
                                                    child: Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons
                                                                .calendar_today,
                                                            size: 15,
                                                            color: mainColor,
                                                          ),
                                                          SizedBox(width: 3),
                                                          Text(
                                                            "${consitionList[index]['date']}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color:
                                                                    mainColor,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "quicksand",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 7),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20),
                                                      child: Text(
                                                        "${consitionList[index]['instruction']}",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "quicksand",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  isDentalEdit == false
                                                      ? Container()
                                                      : Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            "trash",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffF9423A),
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "quicksand",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
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
                              consitionList.length - 1 == index
                                  ? Container()
                                  : Container(
                                      //height: 15,
                                      margin: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 15,
                                          bottom: 10),
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
}
