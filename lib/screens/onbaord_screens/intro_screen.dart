import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/homy.svg",
            width: 150.0,
            height: 150.0,
          ),
          SizedBox(height: 10.0),
          Text(
            'Homy',
            style: TextStyle(
              color: Color.fromRGBO(13, 18, 48, 1),
              fontFamily: 'CM Sans Serif',
              fontSize: 30.0,
              height: 1.5,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Where all shops belongs here.',
            style: TextStyle(
              color: Color.fromRGBO(13, 18, 48, 0.4),
              fontSize: 14.0,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
