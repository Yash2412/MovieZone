import 'package:MovieZone/Theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var options = ['All', 'Movies', 'TV Series', 'Web Series'];
  var genre = ['Comedy', 'Action', 'Fantasy', 'Horror'];
  var _selectedOption = 0;
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
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: kColorGrey,
      //     selectedItemColor: Colors.white,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Watchlist'),
      //     ]),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  padding: EdgeInsets.symmetric(
                      horizontal: kPadding / 2, vertical: kPadding),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 20);
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return FlatButton(
                        color: index == _selectedOption
                            ? kColorCyan.withOpacity(0.8)
                            : Colors.transparent,
                        autofocus: true,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: kColorGrey,
                                width: _selectedOption == index ? 0 : 2)),
                        onPressed: () {
                          setState(() {
                            _selectedOption = index;
                          });
                        },
                        minWidth: 100,
                        child: Text('${options[index]}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('New',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                Container(
                  height: 260,
                  padding: EdgeInsets.symmetric(
                      horizontal: kPadding / 2, vertical: kPadding / 2),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 20);
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 180,
                              width: 140,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.9),
                                          BlendMode.dstATop),
                                      image: NetworkImage(
                                        'https://picsum.photos/seed/new$index/200/300',
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RichText(
                                softWrap: true,
                                textWidthBasis: TextWidthBasis.parent,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          'The Assent of the greate chalie chapline'
                                              .substring(0, 18),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  TextSpan(text: '..\n'),
                                  TextSpan(
                                      text: '2020, Action',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13))
                                ])),
                          )
                        ],
                      ));
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: new EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Genre',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: kPadding / 2),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 20);
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return FlatButton(
                        color: index % 2 == 0
                            ? kColorCyan.withOpacity(0.8)
                            : kColorYellow.withOpacity(0.8),
                        autofocus: true,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide.none),
                        onPressed: () {},
                        minWidth: 150,
                        child: Text('${genre[index]}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: index % 2 == 0
                                    ? Colors.white
                                    : Colors.black)),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: new EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                Container(
                  height: 260,
                  padding: EdgeInsets.symmetric(
                      horizontal: kPadding / 2, vertical: kPadding / 2),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 20);
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 180,
                              width: 140,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.9),
                                          BlendMode.dstATop),
                                      image: NetworkImage(
                                        'https://picsum.photos/seed/popular$index/200/300',
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RichText(
                                softWrap: true,
                                textWidthBasis: TextWidthBasis.parent,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          'The Assent of the greate chalie chapline'
                                              .substring(0, 18),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  TextSpan(text: '..\n'),
                                  TextSpan(
                                      text: '2020, Action',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13))
                                ])),
                          )
                        ],
                      ));
                    },
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 50,
            right: 50,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: kColorGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
