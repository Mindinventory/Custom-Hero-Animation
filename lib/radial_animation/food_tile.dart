import 'package:flutter/material.dart';

import 'Food.dart';

class FoodTile extends AnimatedWidget {
  FoodTile({
    Key key,
    Animation<double> animation,
    this.food,
    this.onAction,
    this.isHeader: false,
    this.delay: 200,
  }):super(key: key, listenable: animation);

  final Food food;
  final VoidCallback onAction;
  final bool isHeader;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: _height,
          child: Stack(
            children: <Widget>[
              _makeInfo(context),
              _makeFood(context),
            ],
          ),
        ),
      ],
    );
  }

  _makeFood(BuildContext context){
    final Animation<double> animation = listenable;
    final double _width = MediaQuery.of(context).size.width;

    Tween<double> tween = Tween(begin: _width - 160, end: 10.0);

    return Positioned(
      top: isHeader ? 0.0 : 10.0,
      bottom: 0.0,
      right: isHeader ? 0.0 : tween.evaluate(animation),
      width: _width,
      child: Hero(
        tag: food.image,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: (){
              if(!isHeader){
                onAction == null ? null : onAction();
              }
            },
            child: Stack(
              children: <Widget>[
                 Positioned(
                  top: isHeader ? 0.0 : 10.0,
                  bottom: isHeader ? 0.0 : 10.0,
                  left: 0.0,
                  right: isHeader ? 0.0 : 20.0,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: !isHeader ? BoxDecoration(
                        color: food.color,
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(80.0),
                          topRight: const Radius.circular(80.0),
                        )
                    ) : BoxDecoration(
                        color: food.color,
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(0.0),
                          topRight: const Radius.circular(0.0),
                        )
                    ),
                    child: Text(
                      food.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.w300,
                        fontSize: 35.0,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(
                      bottom: 30.0,
                      left: 15.0,
                      right: 65.0,
                    ),
                  ),
                ),
                Positioned(
                  top: isHeader ? 50.0 : 20.0,
                  bottom: isHeader ? 20.0 : 20.0,
                  left: isHeader ? _width - 210 : _width - 150,
                  width: isHeader ? 200 : 150.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: food.color,
                        borderRadius: BorderRadius.all(Radius.circular(_height/2)),
                      image: DecorationImage(
                        image: AssetImage(food.asset),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _makeInfo(BuildContext context) {
    return isHeader ? Container() : Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 170.0,
      right: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(food.title, style: Theme.of(context).textTheme.headline.copyWith(color: food.color),),
          ),
          Text('From \$48.00', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500),),
          SizedBox(height: 8.0,),
          Text('Rating ${food.rating}', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            width: double.infinity,
            child: FlatButton(
              color: Colors.grey.shade300,
              onPressed: (){},
              child: Text('Order'),
            ),
          ),
        ],
      ),
    );
  }

  double get _height {
    if(isHeader) {
      return 275.0;
    } else {
      return 200.0;
    }
  }
}