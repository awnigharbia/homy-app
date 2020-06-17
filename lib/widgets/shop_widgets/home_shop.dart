import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class HomeShopTab extends StatelessWidget {
  const HomeShopTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "300 ",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "posts          ",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: "3k ",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "people following this shop",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FlatButton(
              onPressed: () {
                print("follow");
              },
              color: Colors.redAccent,
              child: Text(
                "Follow",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              "Top offers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.only(left: 16.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                OfferCollection(
                  title: "Collection of 2020",
                  discount: 20,
                ),
                OfferCollection(
                  title: "Collection of 2019",
                  discount: 40,
                ),
                OfferCollection(
                  title: "Collection of 2018",
                  discount: 50,
                ),
                OfferCollection(
                  title: "Collection of 2017",
                  discount: 60,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              "Recent posts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 14.0, top: 16.0, right: 14.0),
            child: Column(
              children: <Widget>[
                ShopPost(
                  isCollection: false,
                  image:
                      "https://images.unsplash.com/photo-1512374382149-233c42b6a83b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80",
                ),
                ShopPost(
                  isCollection: true,
                  image:
                      "https://images.unsplash.com/photo-1531310197839-ccf54634509e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80",
                ),
                ShopPost(
                  isCollection: false,
                  image:
                      "https://images.unsplash.com/photo-1532471965572-092fb677a6a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
