import 'package:flutter/material.dart';
import 'package:homewardbase/main.dart';

class LanguageSeeAll extends StatefulWidget {
  @override
  _LanguageSeeAllState createState() => _LanguageSeeAllState();
}

List languageList = [
  {'language': 'English', 'desc': ''},
  {'language': 'Spanish', 'desc': ''},
  {'language': 'Chinese', 'desc': 'Antonese, Mandarin, Other Varieties'},
  {'language': 'French', 'desc': 'French Creole'},
  {'language': 'Filipino', 'desc': ''},
  {'language': 'Vietnamese', 'desc': ''},
  {'language': 'Korean', 'desc': ''},
  {'language': 'German', 'desc': ''},
  {'language': 'Russian', 'desc': ''},
];

class _LanguageSeeAllState extends State<LanguageSeeAll> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   listLanguage = [];
    // });
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
                    child: Icon(Icons.close, color: Colors.black, size: 17)),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Language",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "quicksand",
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    listLanguage = [];
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.only(right: 0, left: 0),
                  child: Center(
                      child: Text(
                    "Clear All",
                    style: TextStyle(
                        color: Color(0xff7A98A9),
                        fontSize: 13,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w400),
                  )),
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
            children: List.generate(languageList.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (!listLanguage
                    .contains("${languageList[index]['language']}")) {
                  listLanguage.add("${languageList[index]['language']}");
                } else {
                  listLanguage.remove("${languageList[index]['language']}");
                }
                print(listLanguage);
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
              margin: EdgeInsets.only(right: 0, left: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "${languageList[index]['language']}",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontFamily: "quicksand",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        languageList[index]['desc'] == ''
                            ? Container()
                            : Container(
                                child: Text(
                                  "${languageList[index]['desc']}",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontFamily: "quicksand",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                      ],
                    ),
                  ),
                  listLanguage.contains(languageList[index]['language'])
                      ? Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(3)),
                          child:
                              Icon(Icons.done, color: Colors.white, size: 14),
                        )
                      : Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                              color: Color(0xffD4DDE3),
                              borderRadius: BorderRadius.circular(3)))
                ],
              ),
            ),
          );
        })),
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
                      "OK",
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
