import 'package:flutter/material.dart';
import 'package:homewardbase/main.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = new TextEditingController();
  String email = "";
  bool emailCorrect = false;
  bool emailSent = false;

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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 0),
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "quicksand",
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 22, right: 40, top: 10, bottom: 40),
                child: Text(
                  "Enter your email below to receive your password reset instructions.",
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
                              if (email.contains('@') && email.contains(".")) {
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
              emailSent
                  ? Container(
                      margin: EdgeInsets.only(
                          left: 22, right: 20, top: 5, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.done,
                            color: selectedColor,
                            size: 14,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "6 digit code has been sent to your email successfully! Please check your email to proceed",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "quicksand",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginPage()));
                  setState(() {
                    emailSent = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Next",
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
    );
  }
}
