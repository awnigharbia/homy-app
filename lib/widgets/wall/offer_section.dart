import 'package:flutter/material.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({Key key}) : super(key: key);

  Widget offerItem({String title, String image}) {
    return Stack(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 5),
        height: 120,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.9],
            colors: [
              Color.fromRGBO(0, 0, 0, 0.4),
              Color.fromRGBO(0, 0, 0, 0.4)
            ],
          ),
        ),
        width: 200,
        height: 120,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.timer,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 150),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
            child: Text(
              "Top Offers",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                offerItem(
                    title: "Food & Fruit",
                    image:
                        "https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80"),
                offerItem(
                  title: "Shoes & Fashion",
                  image:
                      "https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80",
                ),
                offerItem(
                  title: "Cloths & Fashion",
                  image:
                      "https://images.unsplash.com/photo-1544261480-9f3c8c9859be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=755&q=80",
                ),
                offerItem(
                  title: "Fashion & Perfume",
                  image:
                      "https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80",
                ),
                offerItem(
                  title: "Technology & Electronic",
                  image:
                      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
