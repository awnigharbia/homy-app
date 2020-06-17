import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ListTile(
          leading: Icon(EvaIcons.phoneOutline),
          title: Text("+972 598782498"),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text("Palestine, Gaza Al-Remal streat"),
        ),
        ListTile(
          leading: Icon(EvaIcons.shoppingCartOutline),
          title: Text("Cloths and Style"),
        ),
        ListTile(
          leading: Icon(EvaIcons.infoOutline),
          title: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
        ),
      ]),
    );
  }
}
