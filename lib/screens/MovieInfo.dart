import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../Theme.dart';

class MovieInfo extends StatefulWidget {
  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
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
          Stack(
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
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.red,
                child: Text('fjsdlkfsdfdsf'),
              )
            ],
          )
        ],
      ),
    );
  }
}
