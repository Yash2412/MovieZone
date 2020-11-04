import 'package:flutter/material.dart';
import 'package:MovieZone/Theme.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: kColorBlack),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 150,
                left: 80,
                height: 50,
                width: 300,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                top: 200,
                left: 87,
                height: 50,
                width: 300,
                child: Text(
                  'MovieZone',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                top: 250,
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: new DecorationImage(
                        image: AssetImage("images/thetre.jpg"),
                        fit: BoxFit.cover,
                      )),
                )),
            Positioned(
                top: 550,
                width: 275,
                height: 55,
                left: 67,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                      side: BorderSide(color: kColorCyan)),
                  onPressed: () {},
                  color: kColorCyan,
                  textColor: Colors.white,
                  child: Text("Sign-In".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                )),
            Positioned(
                top: 620,
                width: 275,
                height: 55,
                left: 67,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                      side: BorderSide(color: kColorYellow)),
                  onPressed: () {},
                  color: kColorYellow,
                  child: Text("Sign-Up".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ))
          ],
        ),
      ),
    );
  }
}
