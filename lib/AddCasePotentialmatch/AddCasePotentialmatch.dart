import 'package:flutter/material.dart';
import 'package:homewardbase/RequestSentPage/RequestSentPage.dart';

import '../main.dart';

class AddCasePotentialmatch extends StatefulWidget {
  @override
  _AddCasePotentialmatchState createState() => _AddCasePotentialmatchState();
}

class _AddCasePotentialmatchState extends State<AddCasePotentialmatch> {
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
                "Potential match",
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
                "if you recognize anyone listed below, you can send them a request to add you to the case.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff003A5B),
                    fontFamily: "quicksand",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
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
                                  decoration: BoxDecoration(
                                      color: potentialPeople[index]
                                                  ['checked'] ==
                                              true
                                          ? mainColor
                                          : Color(0xffD4DDE3),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(2),
                                  child: Icon(Icons.done,
                                      color: potentialPeople[index]
                                                  ['checked'] ==
                                              true
                                          ? Colors.white
                                          : Color(0xffD4DDE3),
                                      size: 15)),
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
          ]),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RequestSentPage()));
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
                  "Send request",
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
    );
  }
}
