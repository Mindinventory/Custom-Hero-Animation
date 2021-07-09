import 'dart:async';
import 'package:animation_demo/radial_animation/Food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_tile.dart';

class FoodDetail extends StatefulWidget {
  final Food food;
  final CurvedAnimation animation;
  final VoidCallback onAction;

  FoodDetail({this.food, this.animation, this.onAction});

  @override
  _FoodDetailState createState() => new _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool _visible = false;

  @override
  void initState() {
    if(widget.food.isDark){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    Future.delayed(Duration(milliseconds: 250)).then((v){
      setState(() {
        _visible = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Food food = widget.food;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              FoodTile(
                isHeader: true,
                food: food,
                animation: widget.animation,
                onAction: widget.onAction,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          'Ingredients',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: food.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                        child: Text(food.note,),
                      ),
                      Divider(height: 10.0, indent: 35.0,),
                      // Container(
                      //   width: double.infinity,
                      //   padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      //   child: Text(
                      //     'Word from the Maker',
                      //     textAlign: TextAlign.left,
                      //     style: Theme.of(context).textTheme.body2,
                      //   ),
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                      //   child: Text(food.word,),
                      // ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: FlatButton(
                    color: Colors.grey.shade300,
                    onPressed: (){},
                    child: Text('Order'),
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            top: _visible ? 35.0 : 0.0,
            left: 10.0,
            height: 50.0,
            width: 50.0,
            duration: Duration(milliseconds: 150),
            curve: Curves.bounceInOut,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
              opacity: _visible ? 1.0 : 0.0,
              child: IconButton(
                icon: Icon(Icons.clear),
                color: Colors.white,
                onPressed: (){
                  setState(() {
                    _visible = false;
                  });
                  widget.onAction != null ? widget.onAction() : null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}