import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class ShopCollections extends StatelessWidget {
  const ShopCollections({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Recent Collections",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ]),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right:16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return OfferCollection(
                        count: index,
                        title: "Collection 201$index",
                      );
                    },
                    childCount: 20,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
