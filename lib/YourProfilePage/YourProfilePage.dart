import 'package:flutter/material.dart';

import '../main.dart';

class YourProfilePage extends StatefulWidget {
  @override
  _YourProfilePageState createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> {
  List potentialPeople = [
    {
      'pic': 'assets/image/baby4.png',
      'name': 'Liliana Hudson',
      'desc': 'Foster Placement',
      'year': '12',
      'starting': '05-18-2019',
      'ending': 'Present',
    },
    {
      'pic': 'assets/image/baby5.png',
      'name': 'Alannah Bradley',
      'desc': 'Adoptive Placement',
      'year': '10',
      'starting': '10-12-2019',
      'ending': '02-09-2020',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/your_profile.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                            height: 63,
                            width: 63,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "John Smith",
                        style: TextStyle(
                            color: mainColor,
                            fontFamily: 'quicksand',
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Caseworker - CP",
                        style: TextStyle(
                            color: Color(0xff7A98A9),
                            fontFamily: 'quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(
                      "About",
                      style: TextStyle(
                          color: Color(0xff313131),
                          fontFamily: 'quicksand',
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
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
                              "Joined",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff777D82),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "01/23/2020",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff23272A),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
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
                              "Location",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff777D82),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Detroit, Michigan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff23272A),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
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
                              "Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff777D82),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "testing@ultranesia.com",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff23272A),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
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
                              "Phone Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff777D82),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "(123) 456-7890",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff23272A),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
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
                              "Home Phone Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff777D82),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "(123) 456-7890",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff23272A),
                                  fontSize: 11,
                                  fontFamily: "quicksand",
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(
                      "Related Cases",
                      style: TextStyle(
                          color: Color(0xff313131),
                          fontFamily: 'quicksand',
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
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
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(top: 5, bottom: 5),
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
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "${potentialPeople[index]['desc']} - ${potentialPeople[index]['year']} yo",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: mainColor,
                                            fontSize: 12,
                                            fontFamily: "quicksand",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 14,
                                            right: 14),
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "${potentialPeople[index]['starting']} to ${potentialPeople[index]['ending']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: "quicksand",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
