
import 'package:animation_demo/button_animation%20/screen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomHeroAnimation extends StatefulWidget {

  @override
  _CustomHeroAnimationState createState() => _CustomHeroAnimationState();
}

class _CustomHeroAnimationState extends State<CustomHeroAnimation> {

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return MaterialApp(
      title: 'Customize Hero Animation',
      home: Screen1(),
    );
  }

}