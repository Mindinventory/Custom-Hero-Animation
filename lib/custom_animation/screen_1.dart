import 'package:animation_demo/custom_animation/screen_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_animation.dart';

class Screen_1 extends StatelessWidget {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomAnimation(
              size: 25,
              icons: 5,
            ),
            SizedBox(
              height: 60,
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 2),
                    pageBuilder: (_, __, ___) => Screen_2(),
                  ),
                );
              },
              child: Text('Next !!'),
            )
          ],
        ),
      ),
    );
  }
}