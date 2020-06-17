import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/authentication_event.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class HomeDrawer extends StatelessWidget {
  final TabController controller;
  const HomeDrawer({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                          },
                          icon: Icon(
                            EvaIcons.logOutOutline,
                            color: Colors.white,
                            semanticLabel: "Logout",
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Awni Gharbia",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Customer",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 87, 87, 1),
              ),
            ),
            ListTile(
              leading: Icon(EvaIcons.compassOutline),
              title: Text(
                "Explore",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
              ),
              onTap: () {
                Navigator.pop(context);
                controller.animateTo(2);
              },
            ),
            ListTile(
              leading: Icon(EvaIcons.shoppingBagOutline),
              title: Text(
                "Subscribed stores",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(SlideLeftRoute(widget: SubscribedShops()));
              },
            ),
            ListTile(
              leading: Icon(EvaIcons.bookmarkOutline),
              title: Text(
                "Saved Items",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(SlideLeftRoute(widget: SavedItems()));
              },
            ),
            ListTile(
              leading: Icon(EvaIcons.settingsOutline),
              title: Text("Settings",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/settings");
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                height: 0.2,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(EvaIcons.personAddOutline),
              title: Text("Invite friends",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(EvaIcons.questionMarkCircleOutline),
              title: Text("Matajer FAQ",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
