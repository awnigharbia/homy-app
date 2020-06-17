import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class ShopSection extends StatelessWidget {
  final String title;
  const ShopSection({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin:
              const EdgeInsets.only(top: 30, bottom: 16, left: 15, right: 15),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  )),
              Icon(
                EvaIcons.arrowForwardOutline,
                size: 25,
                color: Colors.black54,
              )
            ],
          ),
        ),
        Container(
            height: 260,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
              ],
            )),
      ],
    );
  }
}
