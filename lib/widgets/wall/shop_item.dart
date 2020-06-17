import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1560234914-03dc8a15a241?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Al Jayyar shop",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        "4k followers",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 70.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {
                    print("follow");
                  },
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(child: ShopItemBottom()),
        ],
      ),
    );
  }
}
