import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;
  SlideLeftRoute({this.widget})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1, 0.0);
            var end = Offset.zero;
            var curve = Curves.easeOutCubic;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

  @override
  void dispose() {
    super.dispose();
  }
}
