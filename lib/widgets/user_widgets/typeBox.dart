import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';


class TypeBox extends StatelessWidget {
  final String url;
  final String name;
  final bool active;
  final ShopCategories categories;
  final ShopCategories category;
  final void changeCategory;
  const TypeBox(
      {Key key,
      @required this.url,
      @required this.name,
      this.active,
      this.categories,
      this.category,
      this.changeCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                url,
                width: 60.0,
                height: 60.0,
              ),
              SizedBox(width: 16.0),
              Text(
                name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Radio(
            value: category,
            groupValue: categories,
            onChanged: (val) {
              print(val);
            },
          )
        ],
      ),
    );
  }
}
