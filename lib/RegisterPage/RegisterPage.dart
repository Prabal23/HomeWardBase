import 'package:flutter/material.dart';
import 'package:homewardbase/CreateProfilePage/CreateProfilePage.dart';
import 'package:homewardbase/LoginPage/LoginPage.dart';
import 'package:homewardbase/main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController conPassController = new TextEditingController();
  bool emailCorrect = false;
  bool passSeen = false;
  bool conPassSeen = false;
  String email = "", password = "", conPass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.chevron_left, color: Colors.black, size: 35))),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(15),
                      child: Image.asset("assets/image/small_logo.png")),
                  Container(
                    margin:
                        EdgeInsets.only(left: 20, right: 15, top: 0, bottom: 0),
                    child: Text(
                      "Create an account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "quicksand",
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 22, right: 40, top: 10, bottom: 40),
                    child: Text(
                      "Please add your details below to create a new account.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xff003A5B),
                          fontFamily: "quicksand",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 20, top: 0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                  if (email.contains('@') &&
                                      email.contains(".")) {
                                    emailCorrect = true;
                                  } else {
                                    emailCorrect = false;
                                  }
                                });
                              },
                              controller: emailController,
                              autofocus: false,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Color(0xff003A5B).withOpacity(0.6),
                                  fontFamily: 'quicksand',
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                hintText: "abc@xyz.com",
                                hintStyle: TextStyle(
                                    color: Color(0xff003A5B).withOpacity(0.6),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w600),
                                labelStyle: TextStyle(
                                    color: Color(0xff003A5B),
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
                          email == ""
                              ? Container()
                              : Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: emailCorrect
                                          ? selectedColor
                                          : Colors.redAccent.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    emailCorrect ? Icons.done : Icons.close,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                        ],
                      )),
                  Container(
                    //height: 15,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.15,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 15, top: 15),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: passController,
                              obscureText: passSeen ? false : true,
                              autofocus: false,
                              style: TextStyle(
                                  color: Color(0xff003A5B).withOpacity(0.6),
                                  fontSize: 15,
                                  fontFamily: 'quicksand',
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                hintText: "XXXXXXX",
                                hintStyle: TextStyle(
                                    color: Color(0xff003A5B).withOpacity(0.6),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w600),
                                labelStyle: TextStyle(
                                    color: Color(0xff003A5B),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w500),
                                labelText: "Password",
                                contentPadding:
                                    EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (passSeen) {
                                  passSeen = false;
                                } else {
                                  passSeen = true;
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                passSeen
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    //height: 15,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.15,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 15, top: 15),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: conPassController,
                              obscureText: conPassSeen ? false : true,
                              autofocus: false,
                              style: TextStyle(
                                  color: Color(0xff003A5B).withOpacity(0.6),
                                  fontSize: 15,
                                  fontFamily: 'quicksand',
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                hintText: "XXXXXXX",
                                hintStyle: TextStyle(
                                    color: Color(0xff003A5B).withOpacity(0.6),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w600),
                                labelStyle: TextStyle(
                                    color: Color(0xff003A5B),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w500),
                                labelText: "Confirm Password",
                                contentPadding:
                                    EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (conPassSeen) {
                                  conPassSeen = false;
                                } else {
                                  conPassSeen = true;
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                conPassSeen
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    //height: 15,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 0.15,
                      //indent: 20,
                      endIndent: 0,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "By creating an account, you are agreeing to our ",
                            style: TextStyle(
                                color: Color(0xff003A5B),
                                fontFamily: "quicksand",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "Terms and Conditions",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: Color(0xff003A5B),
                                fontFamily: 'quicksand',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateProfilePage()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        margin: EdgeInsets.only(top: 30),
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
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 22, right: 20, top: 5, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: selectedColor,
                          fontFamily: "quicksand",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
