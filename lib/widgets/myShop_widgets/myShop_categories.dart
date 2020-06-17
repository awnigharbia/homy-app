import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MyShopCategories extends StatelessWidget {
  const MyShopCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/editCategories");
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.redAccent,
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(
            20,
            (index) => ListTile(
              title: Text("Category $index"),
              trailing: Icon(EvaIcons.arrowIosForwardOutline),
            ),
          ),
        )
      ]),
    );
  }
}
