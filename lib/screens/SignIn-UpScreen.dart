// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Theme.dart';
import 'dart:async';
import 'dart:convert';

class SignInScreen extends StatefulWidget {
  final updateParentState;
  SignInScreen({this.updateParentState});
  @override
  _SignInScreenState createState() =>
      _SignInScreenState(updateParentState: updateParentState);
}

String errorForSigin(num) {
  if (num == 1) {
    return "plz enter username";
  } else if (num == 2) {
    return "plz enter password";
  } else if (num == 3) {
    return "server timed out";
  } else if (num == 4)
    return "values are correct";
  else
    return "enter correct details";
}

class SigninObj {
  bool iscorrect;
  int value;
  SigninObj({this.iscorrect, this.value});
  factory SigninObj.fromJson(Map json) {
    return SigninObj(iscorrect: json['isCorrectData'], value: json['value']);
  }
}

Future<SigninObj> fetchSignin(String username, String password) async {
  final http.Response response = await http.post(
    "http://10.0.2.2:3000/signin",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return SigninObj.fromJson(jsonDecode(response.body));
  } else {
    return SigninObj.fromJson({'isCorrectData': false, 'value': 3});
  }
}

class _SignInScreenState extends State<SignInScreen> {
  String username = '';
  String password = '';
  int value = 0;
  bool iserror = false;
  bool isloading = false;
  bool iscorrect = false;
  int newvalue = 0;
  var updateParentState;
  _SignInScreenState({this.updateParentState});
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
                                updateParentState(2);
                              })
                      ])
                    ]),
                  )),
              SizedBox(height: 15),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        filled: true,
                        hintText: 'username',
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
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
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
                  onPressed: () async {
                    if (username == '')
                      setState(() {
                        iserror = true;
                        value = 1;
                      });
                    else if (password == '')
                      setState(() {
                        iserror = true;
                        value = 2;
                      });
                    else {
                      setState(() {
                        isloading = true;
                        iserror = false;
                      });
                      var temp = await fetchSignin(username, password)
                          .timeout(const Duration(seconds: 8), onTimeout: () {
                        return SigninObj.fromJson(
                            {'isCorrectData': false, 'value': 3});
                      });
                      if (temp.value == 3) {
                        setState(() {
                          iserror = true;
                          isloading = false;
                          value = 3;
                        });
                      } else {
                        if (temp.iscorrect) {
                          setState(() {
                            iserror = true;
                            isloading = false;
                            value = 4;
                          });
                          updateParentState(3);
                        } else {
                          setState(() {
                            iserror = true;
                            isloading = false;
                            value = 5;
                          });
                        }
                      }
                    }
                  },
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
              Visibility(
                  visible: iserror,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Center(
                      child: Text(errorForSigin(value),
                          style: TextStyle(
                              fontSize: 16,
                              color: kColorYellow,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
              Visibility(
                  visible: isloading,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                      image: AssetImage("images/loading5.gif"),
                      fit: BoxFit.cover,
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

String errorForSigup(num) {
  if (num == 1) {
    return "plz enter name";
  } else if (num == 2) {
    return "plz enter username";
  } else if (num == 3) {
    return "plz enter password";
  } else if (num == 4)
    return "plz again enter password";
  else if (num == 5)
    return "username alredy exist";
  else if (num == 6)
    return "password did not match";
  else if (num == 7) return "user created succesfully";
  return "server timed out";
}

class SignupObj {
  bool issuccesful;
  int value;
  SignupObj({this.issuccesful, this.value});
  factory SignupObj.fromJson(Map json) {
    return SignupObj(issuccesful: json['issuccesful'], value: json['value']);
  }
}

Future<SignupObj> fetchSignup(
    String username, String password, String name) async {
  final http.Response response = await http.post(
    "http://10.0.2.2:3000/signup",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'name': name,
    }),
  );

  if (response.statusCode == 200) {
    return SignupObj.fromJson(jsonDecode(response.body));
  } else {
    return SignupObj.fromJson({'issuccesful': false, 'value': 8});
  }
}

class SignUpScreen extends StatefulWidget {
  final updateParentState;
  SignUpScreen({this.updateParentState});
  @override
  _SignUpScreenState createState() =>
      _SignUpScreenState(updateParentState: this.updateParentState);
}

class _SignUpScreenState extends State<SignUpScreen> {
  var name = '';
  var username = '';
  var password = '';
  var confirmpassword = '';
  var value = 0;
  var isloading = false;
  var iserror = false;
  var updateParentState;
  _SignUpScreenState({this.updateParentState});
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
              SizedBox(height: 80),
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
                                    updateParentState(1);
                                  })
                          ])
                    ]),
                  )),
              SizedBox(height: 15),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
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
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        filled: true,
                        hintText: 'username',
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
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
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
                    onChanged: (value) {
                      setState(() {
                        confirmpassword = value;
                      });
                    },
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
                  onPressed: () async {
                    if (name == '') {
                      setState(() {
                        value = 1;
                        iserror = true;
                      });
                    } else if (username == '') {
                      setState(() {
                        value = 2;
                        iserror = true;
                      });
                    } else if (password == '') {
                      setState(() {
                        value = 3;
                        iserror = true;
                      });
                    } else if (confirmpassword == '') {
                      setState(() {
                        value = 4;
                        iserror = true;
                      });
                    } else if (confirmpassword != password) {
                      setState(() {
                        value = 6;
                        iserror = true;
                      });
                    } else {
                      setState(() {
                        isloading = true;
                        iserror = false;
                      });
                      var temp = await fetchSignup(username, password, name)
                          .timeout(const Duration(seconds: 8), onTimeout: () {
                        return SignupObj.fromJson(
                            {'issuccesful': false, 'value': 8});
                      });
                      if (temp.value == 8) {
                        setState(() {
                          isloading = false;
                          iserror = true;
                          value = 8;
                        });
                      } else {
                        if (temp.issuccesful) {
                          setState(() {
                            isloading = false;
                            iserror = true;
                            value = 7;
                          });
                        } else {
                          setState(() {
                            isloading = false;
                            iserror = true;
                            value = 5;
                          });
                        }
                      }
                    }
                  },
                  color: kColorYellow,
                  textColor: Colors.white,
                  child: Text("Sign up",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Visibility(
                  visible: iserror,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: Center(
                      child: Text(errorForSigup(value),
                          style: TextStyle(
                              fontSize: 16,
                              color: kColorCyan,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
              Visibility(
                  visible: isloading,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                      image: AssetImage("images/loading5.gif"),
                      fit: BoxFit.cover,
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
