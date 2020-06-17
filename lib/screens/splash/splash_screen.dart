import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
            'assets/homy.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
