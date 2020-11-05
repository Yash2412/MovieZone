import 'package:MovieZone/screens/SignIn-UpScreen.dart';
import 'package:flutter/material.dart';
import 'package:MovieZone/Theme.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
      ),
      body: Container(
        decoration: BoxDecoration(color: kColorBlack),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Welcome to\n'),
                  TextSpan(text: 'MovieZone'),
                ],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                image: AssetImage("images/thetre.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
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
    );
  }
}
