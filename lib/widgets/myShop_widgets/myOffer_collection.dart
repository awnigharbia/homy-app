import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class MyShopOfferCollection extends StatelessWidget {
  final String title;
  final int discount;
  final int count;
  const MyShopOfferCollection({Key key, this.title, this.discount, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[200],
      ),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.5,
      child: new Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/shopCollection/custom");
          },
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5)),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=343&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: const EdgeInsets.only(
                                      left: 2.0, top: 2.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5)),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              if (discount != null)
                                Icon(
                                  EvaIcons.pricetagsOutline,
                                  size: 20.0,
                                  color: Colors.green[300],
                                ),
                              if (discount != null) SizedBox(width: 5),
                              discount != null
                                  ? Text(
                                      "$discount% off",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.green[300]),
                                    )
                                  : Text(
                                      "$count items",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    width: 35.0,
                    height: 35.0,
                    child: PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.zero,
                      tooltip: "Options",
                      icon: Icon(
                        EvaIcons.moreHorizotnalOutline,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Options>>[
                        PopupMenuItem(
                          height: 50,
                          value: Options.copyUrl,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(0, 0, 0, 0.8),
                                  size: 26.0,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Edit collection",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          height: 50,
                          value: Options.copyUrl,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.trashOutline,
                                  color: Color.fromRGBO(0, 0, 0, 0.8),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Delete Collection",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
