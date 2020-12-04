
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListDetailsAnimation extends StatefulWidget {
  
  int index;
  String image;
  String name;
  String desc;
  ListDetailsAnimation({this.index, this.image, this.desc, this.name});

  @override
  _ListDetailsAnimationState createState() => _ListDetailsAnimationState(index: index, image: image, desc: desc, name: name);
}

class _ListDetailsAnimationState  extends State<ListDetailsAnimation> {
  int index;
  String image;
  String desc;
  String name;
  _ListDetailsAnimationState({this.index, this.image, this.desc, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar:  AppBar(
      //   title: Text('List Hero Animation'),
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(
      //         Icons.navigate_before,
      //       ),
      //     ),
      //   ),
      // ),
      body: Hero(
        tag: 'img' + index.toString(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 210.0,
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.backspace_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 80,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontSize: 18.0,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        desc,
                        style: TextStyle(
                          color: Color.fromRGBO(139, 139, 139, 1),
                          fontSize: 15.0,
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}