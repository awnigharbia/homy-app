import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

List<Widget> normalActions = <Widget>[
  PopupMenuButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: EdgeInsets.zero,
    tooltip: "Options",
    icon: Icon(
      EvaIcons.moreVertical,
    ),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
      PopupMenuItem(
        height: 50,
        value: Options.copyUrl,
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(
                EvaIcons.plus,
                color: Color.fromRGBO(0, 0, 0, 0.8),
                size: 26.0,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Add photo",
                style: TextStyle(
                    fontSize: 14.0, color: Color.fromRGBO(0, 0, 0, 0.8)),
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
                Icons.edit,
                color: Color.fromRGBO(0, 0, 0, 0.8),
                size: 26.0,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Edit name",
                style: TextStyle(
                    fontSize: 14.0, color: Color.fromRGBO(0, 0, 0, 0.8)),
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
                    fontSize: 14.0, color: Color.fromRGBO(0, 0, 0, 0.8)),
              )
            ],
          ),
        ),
      ),
    ],
  ),
];

List<Widget> checkBarActions = <Widget>[
  Icon(EvaIcons.trashOutline),
  SizedBox(width: 10.0),
];

class MyShopCollection extends StatefulWidget {
  MyShopCollection({Key key}) : super(key: key);

  @override
  _MyShopCollectionState createState() => _MyShopCollectionState();
}

class _MyShopCollectionState extends State<MyShopCollection> {
  bool checkBar = false;
  List<int> indexList = new List();

  void longPress(index) {
    if (indexList.contains(index)) {
      indexList.remove(index);
    } else {
      indexList.add(index);
    }
    setState(() {
      if (indexList.isEmpty) {
        checkBar = false;
      } else {
        checkBar = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: checkBar
            ? IconButton(
                onPressed: () {
                  setState(() {
                    checkBar = false;
                    indexList = [];
                  });
                },
                icon: Icon(EvaIcons.close),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(EvaIcons.arrowBack),
              ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: new Text(
          checkBar ? '${indexList.length} selected' : 'Collection 2019',
          style: TextStyle(color: Colors.black),
        ),
        actions: checkBar ? checkBarActions : normalActions,
      ),
      body: new GridView.count(
          padding: const EdgeInsets.all(16.0),
          primary: false,
          childAspectRatio: 0.61,
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: List.generate(100, (index) {
            return _Tile(
              index: index,
              checkBarEnabled: checkBar,
              active: indexList.contains(index),
              callback: () {
                longPress(index);
              },
            );
          })),
    );
  }
}

class _Tile extends StatefulWidget {
  final int index;
  final bool checkBarEnabled;
  final bool active;
  final VoidCallback callback;
  _Tile(
      {Key key,
      @required this.index,
      this.checkBarEnabled,
      this.callback,
      this.active})
      : super(key: key);

  @override
  __TileState createState() => __TileState();
}

class __TileState extends State<_Tile> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onLongPress: () {
          setState(() {
            selected = !selected;
          });
          widget.callback();
        },
        onTap: () {
          if (widget.checkBarEnabled) {
            setState(() {
              selected = !selected;
            });
            widget.callback();
          }
        },
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FancyShimmerImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1580928190578-a7f9cd8a7070?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
                boxFit: BoxFit.cover,
              ),
            ),
            widget.checkBarEnabled
                ? Column(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.9],
                            colors: [
                              Color.fromRGBO(254, 254, 254, 0.3),
                              Color.fromRGBO(254, 254, 254, 0.0),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                ),
                                child: Checkbox(
                                  value: widget.active,
                                  onChanged: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                    child: Align(
                      alignment: FractionalOffset.topRight,
                      child: new Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              EvaIcons.eye,
                              size: 14.0,
                              color: Colors.white,
                            ),
                            Text(
                              " ${widget.index}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
