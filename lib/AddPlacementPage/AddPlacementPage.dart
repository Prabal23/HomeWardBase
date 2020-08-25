import 'package:flutter/material.dart';
import 'package:homewardbase/main.dart';

class AddPlacementPage extends StatefulWidget {
  @override
  _AddPlacementPageState createState() => _AddPlacementPageState();
}

class _AddPlacementPageState extends State<AddPlacementPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController datePlacedController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  String name = "",
      address = "",
      datePlaced = "",
      phone = "",
      email = "",
      valType = "",
      valPeople = "";
  List<DropdownMenuItem<String>> _dropDownTypeItems;
  List<DropdownMenuItem<String>> _dropDownPeopleItems;
  List arrType = [
    "Select Placement",
    "Adoptive Placement",
  ];

  List arrPeople = [
    "Select People From List",
  ];

  List listData = [];

  @override
  initState() {
    super.initState();
    // nameController.text = "Adoptive Placement";
    // addressController.text =
    //     "1395 Weekley Street Suite B Saint Albans, NY 11412";
    // datePlacedController.text = "12 Days";
    // phoneController.text = "(123) 456-7890";
    // emailController.text = "testing@ultranesia.com";

    _dropDownTypeItems = getDropDownTypeItems();
    valType = _dropDownTypeItems[0].value;

    _dropDownPeopleItems = getDropDownPeopleItems();
    valPeople = _dropDownPeopleItems[0].value;
  }

  List<DropdownMenuItem<String>> getDropDownTypeItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String typeList in arrType) {
      items.add(new DropdownMenuItem(
          value: typeList,
          child: new Text(
            typeList,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: typeList == "Select Placement"
                    ? mainColor.withOpacity(0.6)
                    : mainColor,
                fontFamily: 'quicksand',
                fontSize: 15,
                fontWeight: FontWeight.w500),
          )));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownPeopleItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String peopleList in arrPeople) {
      items.add(new DropdownMenuItem(
          value: peopleList,
          child: new Text(
            peopleList,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: mainColor,
                fontFamily: 'quicksand',
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 0, left: 0),
                  child: Center(
                      child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Color(0xff7A98A9),
                        fontSize: 13,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w400),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 0),
                child: Text(
                  "Add placment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "quicksand",
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          maxLines: null,
                          minLines: 1,
                          controller: nameController,
                          autofocus: false,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Enter Placement Name",
                            hintStyle: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Placement Name",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          maxLines: null,
                          minLines: 1,
                          controller: addressController,
                          autofocus: false,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Enter Address",
                            hintStyle: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Address",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.15),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(top: 5, bottom: 5, right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 10, top: 5),
                      child: Text(
                        "Placement Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff959595),
                            fontSize: 11.5,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: 33,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          child: DropdownButton(
                            //icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            // iconDisabledColor:
                            //     Color(0xFF008990),
                            iconEnabledColor: Color(0xff003A5B),
                            // iconSize: 40,

                            //hint: Text('Select Situation'),
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff003A5B),
                            ),
                            value: valType,
                            items: _dropDownTypeItems,
                            icon: Icon(
                              Icons.expand_more,
                              size: 15,
                              color: Color(0xff707070),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                valType = value;
                              });
                            },
                          ),
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
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              datePlaced = value;
                            });
                          },
                          maxLines: null,
                          minLines: 1,
                          controller: datePlacedController,
                          autofocus: false,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Enter Date Placed",
                            hintStyle: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Date Placed",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              phone = value;
                            });
                          },
                          maxLines: null,
                          minLines: 1,
                          controller: phoneController,
                          autofocus: false,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "(---) ---- ---",
                            hintStyle: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Placement Phone Number",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(top: 9, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          maxLines: null,
                          minLines: 1,
                          controller: emailController,
                          autofocus: false,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Enter Placement Email",
                            hintStyle: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: Color(0xff959595),
                                fontSize: 15,
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w400),
                            labelText: "Placement Placement Email",
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Add people at placement",
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 15,
                          fontFamily: 'quicksand',
                          fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showAddPeopleDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 8, bottom: 8, right: 0),
                        child: Text(
                          "+ Add People",
                          style: TextStyle(
                              color: selectedColor,
                              fontSize: 15,
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 100, top: 5, bottom: 20),
                child: Text(
                  "No people are associated with this placement yet",
                  style: TextStyle(
                      color: Color(0xff7A98A9),
                      fontSize: 14,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
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
                      "Add placement",
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

  Future<Null> _showAddPeopleDialog() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(builder: (context, setState) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          padding: EdgeInsets.only(bottom: 10, top: 20),
                          child: Text(
                            "Add people",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'quicksand',
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.15),
                              borderRadius: BorderRadius.circular(5)),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          padding: EdgeInsets.only(top: 5, bottom: 5, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, right: 10, top: 5),
                                child: Text(
                                  "Add People",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff7A98A9),
                                      fontSize: 10,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 33,
                                padding: EdgeInsets.only(left: 12, right: 12),
                                child: DropdownButtonHideUnderline(
                                  child: Container(
                                    child: DropdownButton(
                                      //icon: Icon(Icons.arrow_drop_down),
                                      isExpanded: true,
                                      // iconDisabledColor:
                                      //     Color(0xFF008990),
                                      iconEnabledColor: Color(0xff003A5B),
                                      // iconSize: 40,

                                      //hint: Text('Select Situation'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff003A5B),
                                      ),
                                      value: valPeople,
                                      items: _dropDownPeopleItems,
                                      icon: Icon(
                                        Icons.expand_more,
                                        size: 15,
                                        color: Color(0xff707070),
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          valPeople = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 5, bottom: 10, right: 20),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listData.add({
                                      'data': '',
                                    });
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    "or invite by email",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'quicksand',
                                        color: selectedColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              listData.length == 0
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          listData.add({
                                            'data': '',
                                          });
                                        });
                                      },
                                      child: Container(
                                        child: Text(
                                          "+ Invite More",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'quicksand',
                                              color: mainColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        listData.length == 0
                            ? Container()
                            : Container(
                                child: Column(
                                  children:
                                      List.generate(listData.length, (index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.15),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 5),
                                        padding: EdgeInsets.only(
                                            top: 15, bottom: 5, right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    listData[index]['data'] =
                                                        value;
                                                  });
                                                },
                                                autofocus: false,
                                                style: TextStyle(
                                                    color: mainColor,
                                                    fontSize: 12,
                                                    fontFamily: 'quicksand',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                decoration: InputDecoration(
                                                  hintText: "Enter Email",
                                                  hintStyle: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 12,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  labelStyle: TextStyle(
                                                      color: Color(0xff7A98A9),
                                                      fontSize: 10,
                                                      fontFamily: 'quicksand',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  labelText: "Email",
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          12.0, 0, 12.0, 0),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  }),
                                ),
                              ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.white)),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    width: 100,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(
                                        top: 0,
                                        bottom: 20,
                                        left: 0,
                                        right: 2.5),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text("Cancel",
                                        style: TextStyle(
                                            color: Color(0xff003A5B),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "quicksand"))),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          top: 0,
                                          bottom: 20,
                                          left: 2.5,
                                          right: 0),
                                      decoration: BoxDecoration(
                                        color: selectedColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text("Proceed",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "quicksand"))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }));
        });
  }
}
