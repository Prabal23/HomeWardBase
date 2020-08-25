import 'package:flutter/material.dart';

import '../main.dart';

class LogEntryPage extends StatefulWidget {
  @override
  _LogEntryPageState createState() => _LogEntryPageState();
}

class _LogEntryPageState extends State<LogEntryPage> {
  TextEditingController searchController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  String search = "", desc = "", tag = "";
  List tagList = [
    "Visit",
    "Medical",
    "Dental",
    "Education",
    "Therapy",
    "Legal",
    "Bio",
  ];

  List checkedtagList = ["TextField"];
  List checkedNewtagList = [];

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
  bool isAddAttachment = false;
  List<DropdownMenuItem<String>> _dropDownTagItems;

  List<DropdownMenuItem<String>> getDropDownTagItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String tagsList in tagList) {
      items.add(new DropdownMenuItem(
          value: tagsList,
          child: new Text(
            tagsList,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Color(0xff354D5B),
                fontSize: 14,
                fontFamily: 'quicksand',
                fontWeight: FontWeight.w400),
          )));
    }
    return items;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dropDownTagItems = getDropDownTagItems();
    tag = _dropDownTagItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 0, left: 0),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Color(0xff7A98A9),
                        fontSize: 13,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Log Entry",
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
                padding: EdgeInsets.all(5),
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
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "Log Entry",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainColor,
                    fontFamily: "quicksand",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            // Container(
            //   child: Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey, width: 0.15),
            //           borderRadius: BorderRadius.circular(5)),
            //       width: MediaQuery.of(context).size.width,
            //       margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            //       padding:
            //           EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 15),
            //       child: Wrap(
            //         children: <Widget>[
            //           Wrap(
            //               children:
            //                   List.generate(checkedtagList.length, (index) {
            //             return checkedtagList[index] == "TextField"
            //                 ? checkedtagList.length - 1 == tagList.length
            //                     ? Container()
            //                     : Container(
            //                         width: 50,
            //                         margin: EdgeInsets.only(
            //                           left: checkedtagList.length == 0 ? 10 : 0,
            //                         ),
            //                         child: TextField(
            //                           onChanged: (value) {
            //                             setState(() {
            //                               search = value;
            //                             });
            //                           },
            //                           controller: searchController,
            //                           autofocus: true,
            //                           style: TextStyle(
            //                               color: Color(0xff354D5B),
            //                               fontSize: 15,
            //                               fontFamily: 'quicksand',
            //                               fontWeight: FontWeight.w400),
            //                           decoration: InputDecoration(
            //                             hintText: "",
            //                             hintStyle: TextStyle(
            //                                 color: Color(0xff354D5B),
            //                                 fontSize: 14,
            //                                 fontFamily: 'quicksand',
            //                                 fontWeight: FontWeight.w400),
            //                             // labelStyle: TextStyle(
            //                             //     color: Color(0xff7A98A9),
            //                             //     fontSize: 15,
            //                             //     fontFamily: 'quicksand',
            //                             //     fontWeight: FontWeight.w500),
            //                             // labelText: "Old Password",
            //                             contentPadding: EdgeInsets.fromLTRB(
            //                                 0.0, 15, 0.0, 10),
            //                             border: InputBorder.none,
            //                           ),
            //                         ),
            //                       )
            //                 : Container(
            //                     decoration: BoxDecoration(
            //                         color: Color(0xFFF8F8FA),
            //                         borderRadius: BorderRadius.circular(25)),
            //                     padding: EdgeInsets.all(10),
            //                     margin: EdgeInsets.only(
            //                         right: 10, top: 5, bottom: 5),
            //                     child: Wrap(
            //                       children: <Widget>[
            //                         Container(
            //                           margin: EdgeInsets.only(left: 10),
            //                           child: Text(
            //                             "${checkedtagList[index]}",
            //                             style: TextStyle(
            //                                 color: Color(0xff354D5B),
            //                                 fontSize: 14,
            //                                 fontFamily: 'quicksand',
            //                                 fontWeight: FontWeight.w400),
            //                           ),
            //                         ),
            //                         GestureDetector(
            //                           onTap: () {
            //                             setState(() {
            //                               checkedtagList
            //                                   .remove(checkedtagList[index]);
            //                             });
            //                           },
            //                           child: Container(
            //                               padding: EdgeInsets.only(
            //                                   left: 5, right: 5),
            //                               child: Icon(
            //                                 Icons.close,
            //                                 color: Colors.grey,
            //                                 size: 18,
            //                               )),
            //                         )
            //                       ],
            //                     ));
            //           })),

            //           //Container(child: Icon(Icons.add, color: selectedColor)),
            //         ],
            //       )),
            // ),
            // search == ""
            //     ? Container()
            //     : Container(
            //         decoration: BoxDecoration(
            //             border: Border.all(color: Colors.grey, width: 0.15),
            //             borderRadius: BorderRadius.circular(5)),
            //         width: MediaQuery.of(context).size.width,
            //         margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            //         child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: List.generate(tagList.length, (index) {
            //               return tagList[index].toLowerCase().contains(search)
            //                   ? GestureDetector(
            //                       onTap: () {
            //                         setState(() {
            //                           if (!checkedtagList
            //                               .contains(tagList[index])) {
            //                             checkedtagList.remove("TextField");
            //                             checkedtagList.add(tagList[index]);
            //                             checkedtagList.add("TextField");
            //                             search = "";
            //                             searchController.text = "";
            //                           } else {
            //                             checkedtagList.remove(tagList[index]);
            //                           }
            //                         });
            //                       },
            //                       child: Container(
            //                           padding: EdgeInsets.all(10),
            //                           child: Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: <Widget>[
            //                               Text(
            //                                 "${tagList[index]}",
            //                                 style: TextStyle(
            //                                     color: Color(0xff354D5B),
            //                                     fontSize: 15,
            //                                     fontFamily: 'quicksand',
            //                                     fontWeight: FontWeight.w400),
            //                               ),
            //                               checkedtagList
            //                                       .contains(tagList[index])
            //                                   ? Icon(
            //                                       Icons.done,
            //                                       color: selectedColor,
            //                                     )
            //                                   : Container()
            //                             ],
            //                           )),
            //                     )
            //                   : Container();
            //             })),
            //       ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.15),
                  borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
                right: 10,
                left: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                      children:
                          List.generate(checkedNewtagList.length, (index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF8F8FA),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Wrap(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "${checkedNewtagList[index]}",
                                style: TextStyle(
                                    color: Color(0xff354D5B),
                                    fontSize: 14,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  checkedNewtagList
                                      .remove(checkedNewtagList[index]);

                                  if (checkedNewtagList == []) {
                                    tag = checkedNewtagList[0];
                                  }
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                    size: 18,
                                  )),
                            )
                          ],
                        ));
                  })),
                  DropdownButtonHideUnderline(
                    child: Container(
                      child: DropdownButton(
                        //icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        // iconDisabledColor:
                        //     Color(0xFF008990),
                        iconEnabledColor: Color(0xff003A5B),
                        // iconSize: 40,

                        hint: Text("Tag"),
                        style: TextStyle(
                            color: Color(0xff354D5B),
                            fontSize: 14,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w400),
                        //value: tag,
                        items: _dropDownTagItems,
                        icon: Icon(
                          Icons.expand_more,
                          size: 20,
                          color: Color(0xff003A5B),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            tag = value;
                            if (tag != "Tag" &&
                                !checkedNewtagList.contains(tag)) {
                              checkedNewtagList.add(tag);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.15),
                  borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(top: 10, bottom: 5, right: 10),
              alignment: Alignment.topLeft,
              child: new ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 120.0, minHeight: 70),
                child: Column(
                  children: <Widget>[
                    new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      child: new TextField(
                        maxLines: null,
                        autofocus: false,
                        controller: descController,
                        decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: TextStyle(
                              color: Color(0xff354D5B),
                              fontSize: 14,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w400),
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            desc = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Date Occurred",
                        style: TextStyle(
                            color: Color(0xff354D5B),
                            fontSize: 14,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                          child: Image.asset(
                        "assets/image/calendar1.png",
                        height: 17,
                        width: 17,
                      )),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (isAddAttachment) {
                    isAddAttachment = false;
                  } else {
                    isAddAttachment = true;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF8F8FA),
                    border: Border.all(color: Color(0xFFF8F8FA), width: 0.15),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 15),
                alignment: Alignment.center,
                child: Text(
                  "+ Add files or photos",
                  style: TextStyle(
                      color: Color(0xff354D5B),
                      fontSize: 11,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            isAddAttachment == false
                ? Container()
                : Container(
                    margin: EdgeInsets.only(bottom: 20, top: 15),
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
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                      color: Color(0xffECF0F3),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        attachment.remove(attachment[index]);
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: Image.asset(
                                          "assets/image/close.png",
                                          //height: 17,
                                          width: 10,
                                        )),
                                  ),
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
      bottomNavigationBar: Wrap(
        children: <Widget>[
          Container(
            //height: 15,
            margin: EdgeInsets.only(left: 0, right: 0, top: 5),
            child: Divider(
              color: Colors.black,
              height: 2,
              thickness: 0.1,
              //indent: 20,
              endIndent: 0,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                      "Add log entry",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "quicksand",
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
