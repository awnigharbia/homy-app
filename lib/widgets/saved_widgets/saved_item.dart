import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SavedItem extends StatelessWidget {
  final String title;
  final String owner;
  final int imageCount;
  final bool isSaved;
  final String thumbnail;
  const SavedItem(
      {Key key,
      this.title,
      this.owner,
      this.imageCount,
      this.isSaved,
      this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.only(right: 10.0),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("Hello");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        child: Image.network(
                          thumbnail,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "$owner . $imageCount images",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "4 hours ago",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              PopupMenuButton(
                tooltip: "Options",
                padding: EdgeInsets.zero,
                icon: Icon(EvaIcons.moreHorizotnalOutline),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    height: 40,
                    value: "unsubscribe",
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(EvaIcons.trash2Outline, color: Colors.red[400]),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Unsave")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
