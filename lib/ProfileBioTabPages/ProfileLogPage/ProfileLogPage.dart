import 'package:flutter/material.dart';
import 'package:homewardbase/LogFilterPage/LogFilterPage.dart';

import '../../main.dart';

class ProfileLogPage extends StatefulWidget {
  @override
  _ProfileLogPageState createState() => _ProfileLogPageState();
}

class _ProfileLogPageState extends State<ProfileLogPage> {
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

  String searchLog = "";
  TextEditingController searchLogController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
              padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchLog = value;
                  });
                },
                controller: searchLogController,
                autofocus: false,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontSize: 17,
                    fontFamily: 'quicksand',
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    margin: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/image/search1.png',
                      height: 12,
                      width: 12,
                    ),
                  ),
                  suffixIcon: Wrap(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogFilterPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 10),
                          margin: EdgeInsets.only(left: 10, top: 5),
                          child: Image.asset(
                            'assets/image/filter1.png',
                            height: 16,
                            width: 16,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 5, top: 10, right: 10, bottom: 10),
                          child: Icon(
                            Icons.done_all,
                            color: Color(0xff354D5B),
                          )),
                    ],
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color(0xff354D5B),
                      fontSize: 17,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w400),
                  // labelStyle: TextStyle(
                  //     color: Color(0xff7A98A9),
                  //     fontSize: 15,
                  //     fontFamily: 'quicksand',
                  //     fontWeight: FontWeight.w500),
                  // labelText: "Old Password",
                  contentPadding: EdgeInsets.fromLTRB(12.0, 12, 12.0, 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            Column(
                children: List.generate(logList.length, (index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
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
                                  right: logList[index]['status'] == "added"
                                      ? 150
                                      : 100),
                              child: Text(
                                "${logList[index]['log']}",
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 12,
                                    fontFamily: "quicksand",
                                    fontWeight:
                                        logList[index]['status'] == "event"
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
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 0, right: 5),
                                                child: Image.asset(
                                                  'assets/image/feather1.png',
                                                  height: 8,
                                                  width: 8,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0, right: 5),
                                                child: Image.asset(
                                                  'assets/image/lesson1.png',
                                                  height: 8,
                                                  width: 8,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0, right: 5),
                                                child: Image.asset(
                                                  'assets/image/growth1.png',
                                                  height: 8,
                                                  width: 8,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0, right: 5),
                                                child: Image.asset(
                                                  'assets/image/legal.png',
                                                  height: 8,
                                                  width: 8,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0, right: 5),
                                                child: Image.asset(
                                                  'assets/image/teeth1.png',
                                                  height: 8,
                                                  width: 8,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0, right: 10),
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
                                    margin: EdgeInsets.only(top: 15, right: 10),
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
                                    margin:
                                        EdgeInsets.only(bottom: 20, top: 15),
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
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  height: 95,
                                                  width: 105,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffECF0F3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                SizedBox(height: 5),
                                                Container(
                                                  child: Text(
                                                    attachment[index],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff354D5B),
                                                        fontFamily: "quicksand",
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
