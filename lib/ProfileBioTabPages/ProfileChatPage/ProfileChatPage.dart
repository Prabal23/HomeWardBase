import 'package:flutter/material.dart';
import 'package:homewardbase/LogFilterPage/LogFilterPage.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class ProfileChatPage extends StatefulWidget {
  @override
  _ProfileChatPageState createState() => _ProfileChatPageState();
}

class _ProfileChatPageState extends State<ProfileChatPage> {
  TextEditingController searchChatController = new TextEditingController();
  TextEditingController sendChatController = new TextEditingController();
  List chatList = [
    {
      'pic': 'assets/image/c1.png',
      'person': 'Mahdi',
      'chat': 'Hello Linh!',
      'date': 'June 23',
      'time': '02:46',
      'ampm': 'am',
      'view': false,
    },
    {
      'pic': 'assets/image/c1.png',
      'person': 'Mahdi',
      'chat': 'Just talked to @Aref about it.',
      'date': 'June 23',
      'time': '02:46',
      'ampm': 'am',
      'view': false,
    },
    {
      'pic': 'assets/image/baby2.png',
      'person': 'Me',
      'chat': '👋 lan Payne',
      'date': 'June 23',
      'time': '02:47',
      'ampm': 'am',
      'view': false,
    },
    {
      'pic': 'assets/image/baby2.png',
      'person': 'Me',
      'chat': 'Thank you, I also love it.',
      'date': 'June 23',
      'time': '02:47',
      'ampm': 'am',
      'view': false,
    },
    {
      'pic': 'assets/image/baby2.png',
      'person': 'Me',
      'chat': 'Good morning ☀️',
      'date': 'June 23',
      'time': '02:47',
      'ampm': 'am',
      'view': false,
    },
    {
      'pic': 'assets/image/c2.png',
      'person': 'Aref',
      'chat': 'Hello Linh!',
      'date': 'June 23',
      'time': '02:48',
      'ampm': 'am',
      'view': false,
    },
    {
      'pic': 'assets/image/c2.png',
      'person': 'Aref',
      'chat': 'I really love your work, a great job 💪',
      'date': 'June 23',
      'time': '02:48',
      'ampm': 'am',
      'view': false,
    },
  ];
  List chatPerson = [];
  List chat = [];
  String searchChat = "";
  String sendChat = "";
  String user = "";
  var currentTime = DateTime.now();
  String currentDate = "";
  String currentMonth = "";
  String currentYear = "";
  String currentWeekDay = "";
  String today = "";
  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for (int i = 0; i < chatList.length; i++) {
        chatPerson.add(chatList[i]['person']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 0),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSearch = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: isSearch ? 5 : 20),
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: isSearch ? 0 : 10),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchChat = value;
                                    List chat = [];
                                    for (int i = 0; i < chatList.length; i++) {
                                      if (chatList[i]['chat']
                                          .contains(searchChat)) {
                                        //chat.add(chatList[i]);
                                      }
                                    }
                                    //chatList = chat;
                                  });
                                },
                                controller: searchChatController,
                                autofocus: false,
                                enabled: isSearch,
                                style: TextStyle(
                                    color: Color(0xff354D5B),
                                    fontSize: 17,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  prefixIcon: Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        right: 10,
                                        bottom: 10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Image.asset(
                                      'assets/image/search1.png',
                                      height: 12,
                                      width: 12,
                                    ),
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
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12.0, 12, 12.0, 12),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            isSearch
                                ? Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.chevron_left,
                                              color: selectedColor, size: 18),
                                        ),
                                        Text(
                                          "1/12",
                                          style: TextStyle(
                                              color: Color(0xff354D5B),
                                              fontSize: 12,
                                              fontFamily: 'quicksand',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.chevron_right,
                                              color: selectedColor, size: 18),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    isSearch
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearch = false;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.done_outline,
                                    size: 15,
                                    color: selectedColor,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "Re-type",
                                    style: TextStyle(
                                        color: selectedColor,
                                        fontSize: 12,
                                        fontFamily: 'quicksand',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: new ScrollBehavior()
                      ..buildViewportChrome(context, null, AxisDirection.down),
                    child: Container(
                      margin: EdgeInsets.only(bottom: isSearch ? 0 : 90),
                      child: ListView.builder(
                          itemCount: chatList.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<TextSpan> spanText = [];
                            int samePerson = 0;
                            if (user == chatList[index]['person']) {
                              samePerson = 1;
                            }
                            user = chatList[index]['person'];

                            String msg = chatList[index]['chat'];
                            List msgList = msg.split(" ");
                            print("msgList ${index + 1}");
                            print(msgList);

                            for (int i = 0; i < msgList.length; i++) {
                              spanText.add(TextSpan(
                                  text: '${msgList[i]} ',
                                  style: TextStyle(
                                      color: chatList[index]['person'] == "Me"
                                          ? Colors.white
                                          : (msgList[i].startsWith("@") &&
                                                  chatPerson.contains(
                                                      msgList[i].substring(1)))
                                              ? selectedColor
                                              : Color(0xff172B4D),
                                      fontSize: 13,
                                      fontFamily: 'quicksand',
                                      fontWeight: (msgList[i].startsWith("@") &&
                                              chatPerson.contains(
                                                  msgList[i].substring(1)))
                                          ? FontWeight.bold
                                          : FontWeight.w600)));
                            }

                            return Column(
                              children: <Widget>[
                                chatList[index]['person'] == "Me"
                                    ? Container()
                                    : samePerson == 1
                                        ? Container()
                                        : Container(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 15),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    "${chatList[index]['pic']}",
                                                    height: 38,
                                                    width: 38,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "${chatList[index]['person']}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff172B4D),
                                                        fontSize: 17,
                                                        fontFamily: 'quicksand',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "${chatList[index]['date']} at ${chatList[index]['time']} ${chatList[index]['ampm']}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                        fontSize: 13,
                                                        fontFamily: 'quicksand',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              left: chatList[index]['person'] ==
                                                      "Me"
                                                  ? 120
                                                  : 50,
                                              right: chatList[index]
                                                          ['person'] ==
                                                      "Me"
                                                  ? 0
                                                  : 120,
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: chatList[
                                                                      index]
                                                                  ['person'] ==
                                                              "Me"
                                                          ? CrossAxisAlignment
                                                              .end
                                                          : CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        ////// <<<<< Message >>>>> //////
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (chatList[
                                                                          index]
                                                                      [
                                                                      'view'] ==
                                                                  true) {
                                                                chatList[index][
                                                                        'view'] =
                                                                    false;
                                                              } else {
                                                                chatList[index][
                                                                        'view'] =
                                                                    true;
                                                              }
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    top: 10,
                                                                    bottom: 10,
                                                                    right: 15),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 1,
                                                                    left: 20,
                                                                    right: 20),
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: chatList[index]
                                                                          [
                                                                          'person'] ==
                                                                      "Me"
                                                                  ? selectedColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                            ),
                                                            // child: Text(
                                                            //   "${chatList[index]['chat']}",
                                                            //   style: TextStyle(color: chatList[index]['person'] == "Me" ? Colors.white : Color(0xff172B4D), fontSize: 13, fontFamily: 'quicksand', fontWeight: FontWeight.w600),
                                                            // ),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children:
                                                                        spanText)),
                                                          ),
                                                        ),
                                                        chatList[index]
                                                                    ['view'] ==
                                                                true
                                                            ? Container(
                                                                margin: EdgeInsets.only(
                                                                    left: chatList[index]['person'] ==
                                                                            "Me"
                                                                        ? 0
                                                                        : 20,
                                                                    right: chatList[index]['person'] ==
                                                                            "Me"
                                                                        ? 20
                                                                        : 0,
                                                                    top: 3,
                                                                    bottom: 10),
                                                                child: Text(
                                                                  "${chatList[index]['time']} am",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff172B4D),
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          'quicksand',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                  ),
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
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSearch
              ? Container()
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Container(
                        //height: 90,
                        color: Colors.white,
                        alignment: Alignment.bottomCenter,
                        child: Wrap(
                          children: <Widget>[
                            Container(
                              //height: 15,
                              margin:
                                  EdgeInsets.only(left: 0, right: 0, top: 0),
                              child: Divider(
                                color: Colors.black,
                                height: 2,
                                thickness: 0.1,
                                //indent: 20,
                                endIndent: 0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                margin: EdgeInsets.only(top: 0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF8F8FA),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color(0xFFF8F8FA),
                                    )),
                                child: Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LogFilterPage()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  right: 10,
                                                  bottom: 10),
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 0),
                                              child: Icon(Icons.mood,
                                                  color: Color(0xffC1C7D0),
                                                  size: 20)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              top: 5,
                                              right: 5,
                                              bottom: 5),
                                          margin: EdgeInsets.only(
                                              top: 0, right: 10),
                                          child: Image.asset(
                                            'assets/image/attach.png',
                                            height: 17,
                                            width: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: 45.0,
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            child: TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  sendChat = value;
                                                });
                                              },
                                              controller: sendChatController,
                                              maxLines: null,
                                              autofocus: false,
                                              style: TextStyle(
                                                  color: Color(0xffC1C7D0),
                                                  fontSize: 14,
                                                  fontFamily: 'quicksand',
                                                  fontWeight: FontWeight.w700),
                                              decoration: InputDecoration(
                                                hintText: "Start typing...",
                                                hintStyle: TextStyle(
                                                    color: Color(0xffC1C7D0),
                                                    fontSize: 14,
                                                    fontFamily: 'quicksand',
                                                    fontWeight:
                                                        FontWeight.w700),
                                                // labelStyle: TextStyle(
                                                //     color: Color(0xff7A98A9),
                                                //     fontSize: 15,
                                                //     fontFamily: 'quicksand',
                                                //     fontWeight: FontWeight.w500),
                                                // labelText: "Old Password",
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        0.0, 15, 10.0, 15),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5, top: 5, right: 5, bottom: 5),
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Image.asset(
                                        'assets/image/send.png',
                                        height: 15,
                                        width: 22,
                                      ),
                                    ),
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
        ],
      ),
    );
  }
}
