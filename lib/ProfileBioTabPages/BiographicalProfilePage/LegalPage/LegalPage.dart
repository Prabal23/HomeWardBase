import 'package:flutter/material.dart';
import 'package:homewardbase/ProfileBioPage/ProfileBioPage.dart';

import '../../../main.dart';

class LegalPage extends StatefulWidget {
  @override
  _LegalPageState createState() => _LegalPageState();
}

class _LegalPageState extends State<LegalPage> {
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

  bool isLegalEdit = false;

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
                      "Legal",
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
                        isLegalEdit == false
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLegalEdit = false;
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
                              if (isLegalEdit) {
                                isLegalEdit = false;
                              } else {
                                isLegalEdit = true;
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
                                  isLegalEdit == false
                                      ? Icon(Icons.edit,
                                          size: 11, color: Colors.white)
                                      : Container(),
                                  Text(
                                    isLegalEdit == false ? " Edit" : "Save",
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
                        "Parental Rights",
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
                            "Status",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Terminated",
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
                            "Date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "02-20-2020",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Termination Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff777D82),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 102,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xffECF0F3),
                                borderRadius: BorderRadius.circular(5)),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Notes",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xff777D82),
                                      fontSize: 14,
                                      fontFamily: "quicksand",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Donec Nec Nulla Nisl. Aliquam Hendrerit Placerat Lectus, Sit Amet Posuere Diam Egestas.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff777D82),
                                        fontSize: 14,
                                        fontFamily: "quicksand",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
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
