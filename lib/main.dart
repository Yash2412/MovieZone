import 'package:MovieZone/Theme.dart';
import 'package:MovieZone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:MovieZone/screens/firstscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(kColorBlack);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  void initState() {
    super.initState();
    setColor();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kColorBlack,
        primaryColor: kColorCyan,
        fontFamily: 'Segoe UI',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstScreen(),
    );
  }
}
