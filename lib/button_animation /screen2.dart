
import 'dart:ui';

import 'package:animation_demo/list/list_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return ListAnimation();
                },
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.navigate_before,
            ),
          ),
        ),
      ),
      body: Hero(
        tag: 'customAnimation',
        createRectTween: _createRectTween,
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            'SCREEN 2',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect begin, Rect end})
      : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final double width = lerpDouble(begin.width, end.width, t);
    double startWidthCenter = begin.left + (begin.width / 2);
    double startHeightCenter = begin.top + (begin.height / 2);

    return Rect.fromCircle(center: Offset(startWidthCenter, startHeightCenter), radius: width * 1.7);
  }
}