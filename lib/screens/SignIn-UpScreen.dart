import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Theme.dart';
import 'dart:async';
import 'dart:convert';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
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
                      TextSpan(text: 'Already having an account?', children: <
                          TextSpan>[
                        TextSpan(
                            text: ' Sign in',
                            style: TextStyle(color: kColorCyan, fontSize: 16),
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
