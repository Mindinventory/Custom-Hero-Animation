import 'package:animation_demo/custom_animation/screen_1.dart';
import 'package:animation_demo/details.dart';
import 'package:animation_demo/radial_animation/food_main_List.dart';
import 'package:flutter/material.dart';
import 'List/list_animation.dart';
import 'button_animation /custom_hero_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hero Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      // RadialExpansionDemo(),
      // ListAnimation(),
        FoodMenuMain(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return Screen_1();
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
      body: GestureDetector(
        onTap: () {

          // Navigate to details page

          // Navigator.push(context, MaterialPageRoute(
          //     builder: (_) {
          //       return DetailsScreen();
          //     }
          // ));

          // Navigate with custom route transition
          Navigator.push(context, PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return DetailsScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }
            ),
          );
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSITaeKtjuK5B17HIwGhml6d13nSLOdojN9uw&usqp=CAU',
          ),
          // Using the placeholderBuilder, we can add a placeholder to this location.
          placeholderBuilder: (context, heroSize, child) {
            return Center(
              child: Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            );
          },
          // the flightShuttleBuilder has 4 params.

          flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
            if (direction == HeroFlightDirection.push) {
              return Image.network('data:image/jpeg;base64,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');
            } else {
              return  Icon(Icons.ac_unit);
            }
          },
          // this transitionOnUserGestures work when the back button is pressed in iOS but they don't work on back swipe.
          // like the page will push or pop with navigation redirection.
          transitionOnUserGestures: true,
        ),
      ),
    );
  }
}
