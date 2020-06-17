import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/utils/slideLeftRoute.dart';

class MyShopInfo extends StatelessWidget {
  const MyShopInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ListTile(
          contentPadding: EdgeInsets.only(left: 16.0),
          leading: Icon(EvaIcons.phoneOutline),
          title: Text(
            "+972 598782498",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideLeftRoute(
                  widget: SettingsStorePhone(),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          contentPadding: EdgeInsets.only(left: 16.0),
          title: Text("Palestine, Gaza Al-Remal streat"),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideLeftRoute(
                  widget: SettingsStoreLocation(),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ),
        ListTile(
          leading: Icon(EvaIcons.shoppingCartOutline),
          contentPadding: EdgeInsets.only(left: 16.0),
          title: Text("Cloths and Style"),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideLeftRoute(
                  widget: SettingsStoreType(),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ),
        ListTile(
          leading: Icon(EvaIcons.infoOutline),
          contentPadding: EdgeInsets.only(left: 16.0),
          title: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideLeftRoute(
                  widget: SettingsStoreDescription(),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ),
      ]),
    );
  }
}
