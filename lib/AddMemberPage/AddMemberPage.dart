import 'package:flutter/material.dart';
import 'package:homewardbase/CaseCreatedPage/CaseCreatedPage.dart';
import 'package:homewardbase/InviteSentPage/InviteSentPage.dart';
import 'package:homewardbase/main.dart';

class AddMemberPage extends StatefulWidget {
  final data;
  AddMemberPage(this.data);
  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  List listData = [
    {
      'data': '',
    }
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
                  "assets/image/add_member.png",
                  height: 44,
                )),
            Container(
              margin: EdgeInsets.only(left: 20, right: 15, top: 0, bottom: 0),
              child: Text(
                "Add members",
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
                "Add other case members to keep in the loop.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff003A5B),
                    fontFamily: "quicksand",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              child: Column(
                children: List.generate(listData.length, (index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.15),
                          borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      padding: EdgeInsets.only(top: 15, bottom: 5, right: 10),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  listData[index]['data'] = value;
                                });
                              },
                              autofocus: false,
                              style: TextStyle(
                                  color: Color(0xff003A5B).withOpacity(0.6),
                                  fontSize: 15,
                                  fontFamily: 'quicksand',
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                hintText: "Enter Email",
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
                                labelText: "Email",
                                contentPadding:
                                    EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ));
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  listData.add({
                    'data': '',
                  });
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(left: 22, right: 20, top: 15, bottom: 20),
                child: Text(
                  "+ Add Another",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: selectedColor,
                      fontFamily: "quicksand",
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: widget.data == 1 ? 150 : 115,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.data == 1
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CaseCreatedPage()))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InviteSentPage()));
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  margin: EdgeInsets.only(
                      top: 0, bottom: widget.data == 1 ? 0 : 20),
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: selectedColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Send invites",
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
            widget.data == 1
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, 
                          MaterialPageRoute(
                              builder: (context) => CaseCreatedPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 22, right: 40, top: 0, bottom: 20),
                      child: Text(
                        "Skip",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xff003A5B),
                            fontFamily: "quicksand",
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
