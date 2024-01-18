// main.dart
import 'package:flutter/material.dart';
import 'colors.dart'; // Import your colors file
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Carousel extends StatefulWidget {
  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  // State and logic specific to the dynamic widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/any1-347401.appspot.com/o/groupImages%2F%231ZXP5R.jpeg?alt=media&token=fc1a5741-6d28-4223-8ea6-fe49183d4711"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/any1-347401.appspot.com/o/groupImages%2F%236LXQ2D.jpeg?alt=media&token=c313dee4-eaf8-44e8-b233-43121cfca6c3"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/any1-347401.appspot.com/o/groupImages%2F%2394PHGA.jpeg?alt=media&token=f754b8cd-5454-4681-bd5b-a8114b56af5d"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 380.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}


