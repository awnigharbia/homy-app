import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ShopCategories extends StatelessWidget {
  const ShopCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(
          20,
          (index) => ListTile(
            title: Text("Category $index"),
            trailing: Icon(EvaIcons.arrowIosForwardOutline),
          ),
        ),
      ),
    );
  }
}
