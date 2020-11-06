import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../Theme.dart';

class MovieInfo extends StatefulWidget {
  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'MovieZone',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        backgroundColor: kColorGrey,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                image: new DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/seed/imagee$i/400/300',
                              ),
                              fit: BoxFit.cover,
                            )),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Center(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          child: Container(
                            width: 100,
                            // margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                image: new DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/seed/imagdsds/400/300',
                              ),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Wonder Womam (2017)",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Director : ',
                                    style: TextStyle(
                                        color: kColorYellow,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Patty Jenkins',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Staring : ',
                                    style: TextStyle(
                                        color: kColorCyan,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:
                                      'Gal Gadot,Chris Pine, Robin write, Harsh Raj, Uday Patidar, Yash Janoria',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ])),
                              Divider(color: Colors.white),
                              Row(
                                children: [
                                  Text('Rating : ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Flexible(
                                      child: Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: kColorYellow, size: 20),
                                      Icon(Icons.star,
                                          color: kColorYellow, size: 20),
                                      Icon(Icons.star,
                                          color: kColorYellow, size: 20),
                                      Icon(Icons.star_half,
                                          color: kColorYellow, size: 20),
                                      Icon(Icons.star_border,
                                          color: kColorYellow, size: 20),

                                      // Icon(Icons.star_half,
                                      //     color: kColorYellow),
                                      // Icon(Icons.star_border,
                                      //     color: kColorYellow)
                                    ],
                                  )),
                                  Text('(3.5)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              labelColor: kColorYellow,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.white,
              tabs: [
                new Tab(
                  text: 'Description',
                ),
                new Tab(
                  text: 'Cast',
                ),
                new Tab(
                  text: 'Review',
                )
              ],
              controller: _tabController,
              indicatorColor: kColorYellow,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              children: [
                new Text(
                  "This is call Tab View",
                  style: TextStyle(color: Colors.white),
                ),
                new Text(
                  "This is chat Tab View",
                  style: TextStyle(color: Colors.white),
                ),
                new Text(
                  "This is notification Tab View",
                  style: TextStyle(color: Colors.white),
                ),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
