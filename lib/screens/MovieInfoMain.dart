import 'package:flutter/material.dart';

import '../Theme.dart';

class MovieInfoMain extends StatefulWidget {
  @override
  _MovieInfoMainState createState() => _MovieInfoMainState();
}

class _MovieInfoMainState extends State<MovieInfoMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Zone',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        backgroundColor: kColorGrey,
      ),
    );
  }
}