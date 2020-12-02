
import 'package:animation_demo/button_animation%20/screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildBuyTicketButton(),
      ),
    );
  }

  Widget _buildBuyTicketButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: Material(
        child: BuyButton(),
      ),
    );
  }
}

class BuyButton extends StatefulWidget {
  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState  extends State<BuyButton> with TickerProviderStateMixin {

  String _buttonText = 'Click Here!!';

  AnimationController _controller;
  Animation _roundnessAnimation;
  Animation _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Screen2();
          }),
        );
      }
    });


    _roundnessAnimation = Tween(begin: 10.0, end: 25.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _widthAnimation = Tween(begin: 250.0, end: 40.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonText = '';
            //Starts animation
            _controller.forward();
          });
        },
        child: Hero(
          tag: 'customAnimation',

          // for circle shape
          flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
              ) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            );
          },
          //
          child: Container(
            width: _widthAnimation.value,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(_roundnessAnimation.value),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              _buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),

    );
  }

}