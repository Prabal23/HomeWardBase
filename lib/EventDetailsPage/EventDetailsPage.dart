import 'package:flutter/material.dart';
import 'package:homewardbase/YourProfilePage/YourProfilePage.dart';

import '../main.dart';

class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  List potentialPeople = [
    {
      'pic': 'assets/image/pm1.png',
      'name': 'Skylar Pierce',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Foster Parent',
      'checked': false
    },
    {
      'pic': 'assets/image/pm2.png',
      'name': 'Scott Pierce',
      'desc': 'Arrow Child & Family Ministries',
      'status': 'Foster Parent',
      'checked': false
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    "Details",
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
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 25, right: 20),
              child: Text(
                "Casa Visit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15, right: 20),
              child: Text(
                "Date",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
              child: Text(
                "02-02-2020 08:00 AM to 20-03-2020 08:00 PM",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25, right: 20),
              child: Text(
                "Location",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
              child: Text(
                "5414 Copper View Dr.Detroit. mi 48348",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25, right: 20),
              child: Text(
                "Description",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
              child: Text(
                "Would like to discuss child's progress in School. I would also like to see about setting up another sibling visit",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 35, right: 20),
              child: Text(
                "People",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                  children: List.generate(potentialPeople.length, (index) {
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
                          padding: EdgeInsets.only(left: 0, right: 5),
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
                                    borderRadius: BorderRadius.circular(100)),
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
                                                margin:
                                                    EdgeInsets.only(right: 20),
                                                child: Text(
                                                  "${potentialPeople[index]['name']}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 15,
                                                      fontFamily: "quicksand",
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
                                                      BorderRadius.circular(5)),
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
            Container(
              margin: EdgeInsets.only(left: 20, top: 35, right: 20),
              child: Text(
                "Attachment",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff354D5B),
                    fontFamily: "quicksand",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40, top: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  children: List.generate(attachment.length, (index) {
                    return Container(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 95,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Color(0xffECF0F3),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              attachment[index],
                              style: TextStyle(
                                  color: Color(0xff354D5B),
                                  fontFamily: "quicksand",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
