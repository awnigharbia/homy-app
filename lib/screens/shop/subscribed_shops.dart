import 'package:flutter/material.dart';

class ShopDetails {
  final String profilePic;
  final String name;
  final int timePass;
  final bool isFollowed;

  ShopDetails({this.name, this.timePass, this.isFollowed, this.profilePic});
}

class SubscribedShops extends StatelessWidget {
  final List<ShopDetails> shopes = [
    ShopDetails(
      isFollowed: true,
      name: "Metro Shop",
      timePass: 20,
      profilePic:
          "https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80",
    ),
    ShopDetails(
      isFollowed: true,
      name: "Taj-Mall shop",
      timePass: 3,
      profilePic:
          "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    ),
    ShopDetails(
      isFollowed: true,
      name: "Madenat al lohom",
      timePass: 1,
      profilePic:
          "https://images.unsplash.com/photo-1473187983305-f615310e7daa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subscribed shops")),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        itemCount: shopes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  shopes[index].profilePic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(shopes[index].name),
            subtitle: Text("followed ${shopes[index].timePass} month ago"),
            trailing: FlatButton(
              onPressed: () {},
              child: Text(
                shopes[index].isFollowed ? "Unfollow" : "Follow",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}
