import 'package:flutter/material.dart';
import 'package:MovieZone/Theme.dart';

class Profile extends StatefulWidget {
  final updateParentState;
  Profile({this.updateParentState});
  @override
  _ProfileState createState() =>
      _ProfileState(updateParentState: this.updateParentState);
}

class _ProfileState extends State<Profile> {
  final updateParentState;
  _ProfileState({this.updateParentState});
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
              Container(
                  child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(text: 'WARNING to\n'),
                    TextSpan(text: 'Do backchodi here'),
                  ],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0)),
                  onPressed: () {
                    updateParentState(0);
                  },
                  color: kColorYellow,
                  textColor: Colors.white,
                  child: Text("Chala ja bsdk",
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
