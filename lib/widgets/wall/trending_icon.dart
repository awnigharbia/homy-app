import 'package:flutter/material.dart';

class TrendingIcon extends StatefulWidget {
  TrendingIcon({Key key}) : super(key: key);

  @override
  _TrendingIconState createState() => _TrendingIconState();
}

class _TrendingIconState extends State<TrendingIcon>
    with SingleTickerProviderStateMixin {
  Animation colorAnimation;
  AnimationController colorController;

  @override
  void initState() {
    super.initState();
    colorController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    colorAnimation = Tween(begin: 0.0, end: 2.0).animate(colorController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          colorController.forward();
        }
      });
    colorController.forward();
  }

  @override
  void dispose() {
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [colorAnimation.value, colorAnimation.value],
          colors: [Colors.red, Colors.red[100]],
        ),
      ),
      child: Text(
        "Trending",
        style: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
