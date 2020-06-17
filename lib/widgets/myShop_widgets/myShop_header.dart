import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class MyShopSliverAppBarr extends StatelessWidget {
  final TabController controller;
  const MyShopSliverAppBarr({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      bottom: TabBar(
        isScrollable: true,
        tabs: [
          new Container(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
                left: 5,
                right: 5,
              ),
              child: Text("Home")),
          new Container(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
                left: 5,
                right: 5,
              ),
              child: Text("Collections")),
          new Container(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
                left: 5,
                right: 5,
              ),
              child: Text("Categories")),
          new Container(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
                left: 5,
                right: 5,
              ),
              child: Text("About")),
        ],
        controller: controller,
      ),
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(bottom: 40),
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          // StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        title: FittedBox(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 131,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(20.0),
                                  topRight: const Radius.circular(20.0),
                                ),
                                child: Container(
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
                                          "Choose Photo",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.camera_alt,
                                        ),
                                        title: Text(
                                          "Take a photo",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
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
                                          EvaIcons.trash2Outline,
                                          color: Colors.red[400],
                                        ),
                                        title: Text(
                                          "Remove shop picture",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Color.fromRGBO(254, 254, 254, 0.8),
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(Icons.camera_alt, size: 14.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Al Hello Shop",
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            "Fashion and Style",
                            style: TextStyle(fontSize: 8),
                          ),
                          SizedBox(height: 2.0),
                          Row(
                            children: List.generate(
                              5,
                              (int index) => Icon(
                                EvaIcons.star,
                                size: 10.0,
                                color: Colors.yellow[400],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  DynamicFlexibleSpaceBarTitle(
                    child: new Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            EvaIcons.editOutline,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        background: InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: Text(
                            "Choose Background Photo",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.camera_alt,
                          ),
                          title: Text(
                            "Take a photo",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
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
                            EvaIcons.trash2Outline,
                            color: Colors.red[400],
                          ),
                          title: Text(
                            "Remove shop picture",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1570857502809-08184874388e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=498&q=80',
                fit: BoxFit.cover,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.5),
                    end: Alignment(0.0, 0.0),
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
