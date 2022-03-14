// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'intro_screen.dart';

//import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(), //load intro screen
    );
  }
}
