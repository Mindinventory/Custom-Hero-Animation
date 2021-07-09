import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_animation.dart';

class Screen_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Animation'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.navigate_before,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: CustomAnimation(
            size: 25,
            icons: 5,
          ),
        ),
      ),
    );
  }
}