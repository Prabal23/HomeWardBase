import 'package:flutter/material.dart';
import 'package:homewardbase/main.dart';

class AddNewPage extends StatefulWidget {
  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  bool isAddPeople = false;
  bool isAddAttachment = false;
  String title = "", location = "", desc = "", type = "";
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

  List<DropdownMenuItem<String>> _dropDownTypeItems;

  List typeState = [
    "Type",
    "Biographical",
    "Medical",
    "Dental",
    "Therapy",
    "Education",
    "Legal",
  ];

  List<DropdownMenuItem<String>> getDropDownTypeItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String typeList in typeState) {
      items.add(new DropdownMenuItem(
          value: typeList,
          child: new Text(
            typeList,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: typeList == "Type"
                    ? Color(0xff354D5B).withOpacity(0.6)
                    : Color(0xff354D5B),
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

    _dropDownTypeItems = getDropDownTypeItems();
    type = _dropDownTypeItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Add New",
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, top: 25),
            child: Text(
              "Add New",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: mainColor,
                  fontFamily: "quicksand",
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.15),
                borderRadius: BorderRadius.circular(5)),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              controller: titleController,
              autofocus: false,
              style: TextStyle(
                  color: Color(0xff354D5B),
                  fontSize: 15,
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                    color: Color(0xff354D5B),
                    fontSize: 14,
                    fontFamily: 'quicksand',
                    fontWeight: FontWeight.w400),
                // labelStyle: TextStyle(
                //     color: Color(0xff7A98A9),
                //     fontSize: 15,
                //     fontFamily: 'quicksand',
                //     fontWeight: FontWeight.w500),
                // labelText: "Old Password",
                contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                border: InputBorder.none,
              ),
            ),
          ),
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
            child: DropdownButtonHideUnderline(
              child: Container(
                child: DropdownButton(
                  //icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  // iconDisabledColor:
                  //     Color(0xFF008990),
                  iconEnabledColor: Color(0xff003A5B),
                  // iconSize: 40,

                  //hint: Text('Type'),
                  style: TextStyle(
                      color: Color(0xff354D5B),
                      fontSize: 14,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w400),
                  value: type,
                  items: _dropDownTypeItems,
                  icon: Icon(
                    Icons.expand_more,
                    size: 20,
                    color: Color(0xff003A5B),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      type = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Text(
              "From",
              style: TextStyle(
                  color: Color(0xff354D5B),
                  fontSize: 14,
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.15),
                          borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Date",
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
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.15),
                          borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 20, top: 10),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Time",
                            style: TextStyle(
                                color: Color(0xff354D5B),
                                fontSize: 14,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                              child: Image.asset(
                            "assets/image/time1.png",
                            height: 17,
                            width: 17,
                          )),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10, top: 10),
            child: Text(
              "To",
              style: TextStyle(
                  color: Color(0xff354D5B),
                  fontSize: 14,
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.15),
                          borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Date",
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
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.15),
                          borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 20, top: 10),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Time",
                            style: TextStyle(
                                color: Color(0xff354D5B),
                                fontSize: 14,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                              child: Image.asset(
                            "assets/image/time1.png",
                            height: 17,
                            width: 17,
                          )),
                        ],
                      )),
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
            padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
              controller: locationController,
              autofocus: false,
              style: TextStyle(
                  color: Color(0xff354D5B),
                  fontSize: 15,
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: "Location",
                hintStyle: TextStyle(
                    color: Color(0xff354D5B),
                    fontSize: 14,
                    fontFamily: 'quicksand',
                    fontWeight: FontWeight.w400),
                // labelStyle: TextStyle(
                //     color: Color(0xff7A98A9),
                //     fontSize: 15,
                //     fontFamily: 'quicksand',
                //     fontWeight: FontWeight.w500),
                // labelText: "Old Password",
                contentPadding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                border: InputBorder.none,
              ),
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
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Add People",
                  style: TextStyle(
                      color: Color(0xff354D5B),
                      fontSize: 14,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isAddPeople) {
                        isAddPeople = false;
                      } else {
                        isAddPeople = true;
                      }
                    });
                  },
                  child: Container(
                      child: Image.asset(
                    "assets/image/people.png",
                    //height: 17,
                    width: 53,
                  )),
                ),
              ],
            ),
          ),
          isAddPeople == false
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                      children: List.generate(potentialPeople.length, (index) {
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
                                                      "${potentialPeople[index]['name']}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "quicksand",
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
                                                          BorderRadius.circular(
                                                              5)),
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
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
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
            margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Add Attachment",
                  style: TextStyle(
                      color: Color(0xff354D5B),
                      fontSize: 14,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w500),
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
                      child: Image.asset(
                    "assets/image/attachment.png",
                    //height: 17,
                    width: 53,
                  )),
                ),
              ],
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
        ]),
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
                      "Add",
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
