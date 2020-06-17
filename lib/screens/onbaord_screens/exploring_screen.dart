import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploringScreen extends StatelessWidget {
  const ExploringScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              "assets/explore.svg",
              width: 200,
              height: 250,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Explore',
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.72,
            child: Text(
              "Explore anything you want from all over shopes out there, without any effort!",
              style: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(13, 18, 48, 0.4),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
