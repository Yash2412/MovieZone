import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Theme.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: kColorBlack),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'Don\'t have an account?', children: <
                          TextSpan>[
                        TextSpan(
                            text: ' Sign up',
                            style: TextStyle(color: kColorYellow, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              })
                      ])
                    ]),
                  )),
              SizedBox(height: 15),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(27.0),
                            ),
                            borderSide: BorderSide.none),
                        fillColor: kColorGrey),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(27.0),
                            ),
                            borderSide: BorderSide.none),
                        fillColor: kColorGrey),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0)),
                  onPressed: () {},
                  color: kColorCyan,
                  textColor: Colors.white,
                  child: Text("Sign in",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: FlatButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Text("Forgot password?",
                      style: TextStyle(
                          fontSize: 16,
                          color: kColorCyan,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: kColorBlack),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Already having an account?',
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign in',
                                style:
                                    TextStyle(color: kColorCyan, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                                  })
                          ])
                    ]),
                  )),
              SizedBox(height: 15),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        filled: true,
                        hintText: 'Name',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.white),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(27.0),
                            ),
                            borderSide: BorderSide.none),
                        fillColor: kColorGrey),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.white),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(27.0),
                            ),
                            borderSide: BorderSide.none),
                        fillColor: kColorGrey),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(27.0),
                            ),
                            borderSide: BorderSide.none),
                        fillColor: kColorGrey),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        filled: true,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(27.0),
                            ),
                            borderSide: BorderSide.none),
                        fillColor: kColorGrey),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0)),
                  onPressed: () {},
                  color: kColorYellow,
                  textColor: Colors.white,
                  child: Text("Sign in",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width - 100,
              //   margin: EdgeInsets.symmetric(vertical: 8),
              //   child: FlatButton(
              //     onPressed: () {},
              //     textColor: Colors.white,
              //     child: Text("Forgot password?",
              //         style: TextStyle(
              //             fontSize: 16,
              //             color: kColorYellow,
              //             fontWeight: FontWeight.bold)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
