import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ShopNotification {
  final String name;
  final int timePass;
  final String description;
  final String profilePic;

  ShopNotification(
      {this.name, this.description, this.timePass, this.profilePic});
}

final List<ShopNotification> shopNotifs = [
  ShopNotification(
    name: "Metro Shop",
    timePass: 20,
    description: "New 3 products posted, tap to view!",
    profilePic:
        "https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80",
  ),
  ShopNotification(
    name: "Taj-Mall shop",
    timePass: 3,
    description: "New collection posted, tap to view!",
    profilePic:
        "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  ),
  ShopNotification(
    name: "Madenat al lohom",
    timePass: 1,
    description: "New 6 products posted, tap to view!",
    profilePic:
        "https://images.unsplash.com/photo-1473187983305-f615310e7daa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  ),
];

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key key}) : super(key: key);

  Widget shopNotif({name, description, timePass, profilePic}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    profilePic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            name,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                          SizedBox(width: 5),
                          Text("."),
                          SizedBox(width: 5),
                          Text("${timePass}h ago",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(description,
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                    ]),
              ),
            ],
          ),
        ),
        new Divider(
          height: 0,
          color: Colors.grey[200],
          thickness: 1,
          indent: 5,
          endIndent: 5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Notifications",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Icon(EvaIcons.settingsOutline)
          ],
        ),
        shopNotif(
          name: shopNotifs[0].name,
          description: shopNotifs[0].description,
          profilePic: shopNotifs[0].profilePic,
          timePass: shopNotifs[0].timePass,
        ),
        shopNotif(
          name: shopNotifs[1].name,
          description: shopNotifs[1].description,
          profilePic: shopNotifs[1].profilePic,
          timePass: shopNotifs[1].timePass,
        ),
        shopNotif(
          name: shopNotifs[2].name,
          description: shopNotifs[2].description,
          profilePic: shopNotifs[2].profilePic,
          timePass: shopNotifs[2].timePass,
        ),
        shopNotif(
          name: shopNotifs[0].name,
          description: shopNotifs[0].description,
          profilePic: shopNotifs[0].profilePic,
          timePass: shopNotifs[0].timePass,
        ),
        shopNotif(
          name: shopNotifs[1].name,
          description: shopNotifs[1].description,
          profilePic: shopNotifs[1].profilePic,
          timePass: shopNotifs[1].timePass,
        ),
        shopNotif(
          name: shopNotifs[2].name,
          description: shopNotifs[2].description,
          profilePic: shopNotifs[2].profilePic,
          timePass: shopNotifs[2].timePass,
        ),
        shopNotif(
          name: shopNotifs[0].name,
          description: shopNotifs[0].description,
          profilePic: shopNotifs[0].profilePic,
          timePass: shopNotifs[0].timePass,
        ),
        shopNotif(
          name: shopNotifs[1].name,
          description: shopNotifs[1].description,
          profilePic: shopNotifs[1].profilePic,
          timePass: shopNotifs[1].timePass,
        ),
        shopNotif(
          name: shopNotifs[2].name,
          description: shopNotifs[2].description,
          profilePic: shopNotifs[2].profilePic,
          timePass: shopNotifs[2].timePass,
        ),
        shopNotif(
          name: shopNotifs[0].name,
          description: shopNotifs[0].description,
          profilePic: shopNotifs[0].profilePic,
          timePass: shopNotifs[0].timePass,
        ),
        shopNotif(
          name: shopNotifs[1].name,
          description: shopNotifs[1].description,
          profilePic: shopNotifs[1].profilePic,
          timePass: shopNotifs[1].timePass,
        ),
        shopNotif(
          name: shopNotifs[2].name,
          description: shopNotifs[2].description,
          profilePic: shopNotifs[2].profilePic,
          timePass: shopNotifs[2].timePass,
        ),
        shopNotif(
          name: shopNotifs[0].name,
          description: shopNotifs[0].description,
          profilePic: shopNotifs[0].profilePic,
          timePass: shopNotifs[0].timePass,
        ),
        shopNotif(
          name: shopNotifs[1].name,
          description: shopNotifs[1].description,
          profilePic: shopNotifs[1].profilePic,
          timePass: shopNotifs[1].timePass,
        ),
        shopNotif(
          name: shopNotifs[2].name,
          description: shopNotifs[2].description,
          profilePic: shopNotifs[2].profilePic,
          timePass: shopNotifs[2].timePass,
        ),
      ],
    );
  }
}
