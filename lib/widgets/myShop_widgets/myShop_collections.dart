import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class MyShopCollections extends StatelessWidget {
  const MyShopCollections({Key key}) : super(key: key);

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
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Recent Collections",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        FlatButton(
                          onPressed: () {
                            print("edit");
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
                ]),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    // height: 200,
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ),
                                          child: Text(
                                            "Choose collection photo's",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(EvaIcons.imageOutline),
                                          title: Text(
                                            "Upload from gallery",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.collections,
                                          ),
                                          title: Text(
                                            "Choose from Homy photo's",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.grey[200],
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[100],
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: Icon(EvaIcons.plusOutline, size: 30.0),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  "New Collection",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return MyShopOfferCollection(
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
