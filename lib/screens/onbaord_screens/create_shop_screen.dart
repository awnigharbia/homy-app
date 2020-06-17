import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateShopScreen extends StatelessWidget {
  const CreateShopScreen({Key key}) : super(key: key);

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
              "assets/shop.svg",
              width: 200,
              height: 250,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            "You're shop",
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Text(
              "Create your own store with just a few minutes, and get more and more customers!",
              style: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(13, 18, 48, 0.5),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
