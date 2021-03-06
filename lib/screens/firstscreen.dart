import 'package:MovieZone/screens/SignIn-UpScreen.dart';
import 'package:flutter/material.dart';
import 'package:MovieZone/Theme.dart';

class FirstScreen extends StatelessWidget {
  final updateParentState;
  FirstScreen({this.updateParentState});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: kColorBlack),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                  child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Welcome to\n'),
                    TextSpan(text: 'MovieZone'),
                  ],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 360,
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage("images/thetre.jpg"),
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(height: 3),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0)),
                  onPressed: () {
                    updateParentState(1);
                  },
                  color: kColorCyan,
                  textColor: Colors.white,
                  child: Text("SIGN-IN",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0)),
                  onPressed: () {
                    updateParentState(2);
                  },
                  color: kColorYellow,
                  textColor: Colors.white,
                  child: Text("SIGN-UP",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
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
