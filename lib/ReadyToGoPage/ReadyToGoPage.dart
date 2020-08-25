import 'package:flutter/material.dart';
import 'package:homewardbase/HomePage/HomePage.dart';
import 'package:homewardbase/main.dart';

class ReadyToGoPage extends StatefulWidget {
  @override
  _ReadyToGoPageState createState() => _ReadyToGoPageState();
}

class _ReadyToGoPageState extends State<ReadyToGoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/back2.png"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  //margin: EdgeInsets.only(left:55, right:55),
                                  child: Center(
                                      child: Image.asset(
                                "assets/image/l1.png",
                              ))),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Center(
                                      child: Image.asset(
                                    "assets/image/name.png",
                                  ))),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, top: 80, bottom: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "You're ready to go",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "quicksand",
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, top: 10, bottom: 40),
                                child: Text(
                                  "Thanks for taking the time to create an account.  Next, create or join a case to get started.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "quicksand",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(
                            color: selectedColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Continue",
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
          ),
        ),
      ),
    );
  }
}
