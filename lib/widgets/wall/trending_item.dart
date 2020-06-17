import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/wall/trending_icon.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class TrendingItem extends StatefulWidget {
  final String name;
  final String img;
  TrendingItem({Key key, this.name, this.img}) : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage("${widget.img}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(SlideLeftRoute(widget: ShopScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9],
                colors: [
                  Color.fromRGBO(254, 254, 254, 0.0),
                  Color.fromRGBO(0, 0, 0, 0.3)
                ],
              ),
            ),
            width: double.infinity,
            height: 300,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TrendingIcon(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child:
                                    Image.network("https://picsum.photos/50"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        widget.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: EdgeInsets.all(3.0),
                                        child: Text(
                                          "New Offers!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Gaza, Al-Remal street",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (int index) => Icon(
                                        EvaIcons.star,
                                        size: 10.0,
                                        color: Colors.yellow[400],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
