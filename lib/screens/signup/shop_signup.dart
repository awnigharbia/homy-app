import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/utils/slideLeftRoute.dart';

class ShopSignup extends StatefulWidget {
  ShopSignup({Key key}) : super(key: key);

  @override
  _ShopSignupState createState() => _ShopSignupState();
}

class _ShopSignupState extends State<ShopSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Shop Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          SizedBox(
            width: 70.0,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  SlideLeftRoute(
                    widget: ChooseCategoriesScreen(),
                  ),
                );
              },
              child: Text(
                "Next",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.grey[200],
                        ),
                        child: IconButton(
                          onPressed: () {
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
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Choose shop photo",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: "Shop name",
                          hintText: "Al-Jayyar shop",
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              color: Colors.black45),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: "Shop number",
                          hintText: "+972 598782498",
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              color: Colors.black45),
                          suffixIcon: Icon(EvaIcons.phoneOutline),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: "Shop location",
                            hintText: "Gaza, Al-Remal street",
                            labelStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                color: Colors.black45),
                            suffixIcon: Icon(Icons.location_on)),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        minLines: 6,
                        maxLines: 16,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: "Shop Description",
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              color: Colors.black45),
                          alignLabelWithHint: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
