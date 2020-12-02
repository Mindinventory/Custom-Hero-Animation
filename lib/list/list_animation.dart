import 'package:animation_demo/List/list_details.dart';
import 'package:animation_demo/button_animation%20/custom_hero_animation.dart';
import 'package:animation_demo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {

  @override
  _ListAnimationState createState() => _ListAnimationState();
}

class _ListAnimationState  extends State<ListAnimation> {

  final images = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg',
    'assets/images/6.jpeg',
    'assets/images/7.jpeg',
    'assets/images/8.jpeg',
    'assets/images/9.jpeg',
    'assets/images/10.jpeg',
    'assets/images/11.jpeg',
  ];

  final titles = [
    'Emirates Palace',
    'Rancho Valencia',
    'The Westin Excelsior',
    'Burj Al Arab',
    'The Plaza',
    'Atlantis Paradise Island',
    'Palms',
    'The Boulders',
    'CuisinArt Golf',
    'Marquis Los Cabos',
    'Signiel',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        title: Text('Hero Animation'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return MyHomePage(title: 'Flutter Hero Animation Demo');
                      // CustomHeroAnimation();
                  }
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.navigate_next,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ListDetailsAnimation(
                //       index: index,
                //       image: images[index],
                //       desc: 'The ${titles[index]} is awesome place. if you feel that you need to gop for the vacation.',
                //       name: titles[index],
                //     )));

                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds:900),
                      pageBuilder: (_, __, ___) => ListDetailsAnimation(
                        index: index,
                        image: images[index],
                        desc: 'The ${titles[index]} is awesome place. if you feel that you need to gop for the vacation.',
                        name: titles[index],
                      ),
                    ));

                // Navigator.of(context).push(
                //   PageRouteBuilder(
                //     transitionDuration: Duration(milliseconds: 1000),
                //     pageBuilder: (
                //         BuildContext context,
                //         Animation<double> animation,
                //         Animation<double> secondaryAnimation) {
                //       return ListDetailsAnimation();
                //     },
                //     transitionsBuilder: (
                //         BuildContext context,
                //         Animation<double> animation,
                //         Animation<double> secondaryAnimation,
                //         Widget child) {
                //       return Align(
                //         child: FadeTransition(
                //           opacity: animation,
                //           child: child,
                //         ),
                //       );
                //     },
                //   ),
                // );
              },
              child: Hero(
                tag: 'img' + index.toString(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 230.0,
                  width: double.maxFinite,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB( 16.0, 10.0, 16.0, 5.0 ),
                    height: 310.0,
                    width: double.maxFinite,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 15.0 ),
                      ),
                      elevation: 5,
                      color: Color.fromRGBO( 252, 253, 255, 1 ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0)),
                                  child: Container(
                                    width: double.maxFinite,
                                    height: 100.0,
                                    child:
                                    Image(
                                      image: AssetImage(images[index]),
                                      fit: BoxFit.fill,
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
                                        titles[index],
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
                                      'The ${titles[index]} is awesome place. if you feel that you need to gop for the vacation.',
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
                  ),
                ),
              ),
            );
          },),
      ),
    );
  }
}


// for dialog route
class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({ this.builder }) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return new FadeTransition(
        opacity: new CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut
        ),
        child: child
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => throw UnimplementedError();

}

