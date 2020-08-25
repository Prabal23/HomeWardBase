import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homewardbase/CheckSlider/data.dart';
import 'package:homewardbase/LoginPage/LoginPage.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import '../main.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  List imgList = [
    "assets/image/sp1.png",
    "assets/image/sp2.png",
    "assets/image/sp3.png",
  ];

  List titleList = [
    "Stay in the loop",
    "See what's coming",
    "Work as a team",
  ];

  List txtList = [
    "Maintain and share an accurate and up-to-date-information recorded on the child in care.",
    "Schedule and keep track of all future appointments and other events in the child's life.",
    "Communicate and collaborate easily with everyone involved in the child's case.",
  ];

  List btnText = [
    "Next",
    "Next",
    "Get started",
  ];

  List<Widget> sliderList = [];

  bool sliderCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //mySLides = getSlides();
    controller = new PageController(initialPage: 0, keepPage: true);

    for (int i = 0; i < 3; i++) {
      sliderList.add(SlideTile(
        imagePath: imgList[i],
        title: titleList[i],
        desc: txtList[i],
      ));
    }
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget slider(int sIndex) {
    return Container(
      height: 380,
      child: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            sIndex = index;
            print("slideIndex 1");
            print(slideIndex);
          });
        },
        children: sliderList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                    child: Image.asset(
                  "assets/image/logo2.png",
                  height: 100,
                  width: 250,
                ))),
            GestureDetector(
              onHorizontalDragEnd: (drag) {
                print("drag");
                print(drag);
                if (drag != null) {
                  print("lol");
                } else {
                  print("not lol");
                }
                setState(() {
                  sliderCheck = true;
                });
              },
              child: Container(
                height: 380,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                      print("slideIndex 1");
                      print(slideIndex);
                    });
                  },
                  children: sliderCheck
                      ? <Widget>[
                          SlideTile(
                            imagePath: imgList[slideIndex],
                            title: titleList[slideIndex],
                            desc: txtList[slideIndex],
                          )
                        ]
                      : sliderList,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(btnText, (index, url) {
                  return Container(
                    width: slideIndex == index ? 15.0 : 6.0,
                    height: slideIndex == index ? 6.0 : 6.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 22.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: slideIndex == index ? selectedColor : backColor,
                    ),
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (slideIndex == 0) {
                    slideIndex = 1;
                    controller.animateToPage(1,
                        curve: Curves.linear,
                        duration: Duration(milliseconds: 300));
                  } else if (slideIndex == 1) {
                    slideIndex = 2;
                    controller.animateToPage(2,
                        curve: Curves.linear,
                        duration: Duration(milliseconds: 300));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }

                  print("slideIndex 2");
                  print(slideIndex);

                  sliderCheck = false;
                });
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 170,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    "${btnText[slideIndex]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomSheet: slideIndex != 2
      //     ? Container(
      //         margin: EdgeInsets.symmetric(vertical: 16),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             FlatButton(
      //               onPressed: () {
      //                 controller.animateToPage(2,
      //                     duration: Duration(milliseconds: 400),
      //                     curve: Curves.linear);
      //               },
      //               splashColor: Colors.blue[50],
      //               child: Text(
      //                 "SKIP",
      //                 style: TextStyle(
      //                     color: Color(0xFF0074E4),
      //                     fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //             Container(
      //               child: Row(
      //                 children: [
      //                   for (int i = 0; i < 3; i++)
      //                     i == slideIndex
      //                         ? _buildPageIndicator(true)
      //                         : _buildPageIndicator(false),
      //                 ],
      //               ),
      //             ),
      //             FlatButton(
      //               onPressed: () {
      //                 print("this is slideIndex: $slideIndex");
      //                 controller.animateToPage(slideIndex + 1,
      //                     duration: Duration(milliseconds: 500),
      //                     curve: Curves.linear);
      //               },
      //               splashColor: Colors.blue[50],
      //               child: Text(
      //                 "NEXT",
      //                 style: TextStyle(
      //                     color: Color(0xFF0074E4),
      //                     fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     : InkWell(
      //         onTap: () {
      //           print("Get Started Now");
      //         },
      //         child: Container(
      //           height: Platform.isIOS ? 70 : 60,
      //           color: Colors.blue,
      //           alignment: Alignment.center,
      //           child: Text(
      //             "GET STARTED NOW",
      //             style: TextStyle(
      //                 color: Colors.white, fontWeight: FontWeight.w600),
      //           ),
      //         ),
      //       ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 130,
              height: 130,
              //margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("$imagePath"), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 0),
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003A5B),
                  fontFamily: "quicksand",
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 0),
            child: Text(
              "$desc",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003A5B),
                  fontFamily: "quicksand",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
