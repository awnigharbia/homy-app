import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/collection_bloc/collection_bloc.dart';
import 'package:shop_repository/shop_repository.dart';

List<Widget> normalActions(context, deleteCallback, callback, addNewPhotos) {
  return <Widget>[
    PopupMenuButton(
      onSelected: (value) {
        if (value == 'add') {
          addNewPhotos();
        }
        if (value == 'delete') {
          deleteCallback();
          Navigator.pop(context);
        }

        if (value == 'edit') {
          callback();
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.zero,
      tooltip: "Options",
      icon: Icon(
        EvaIcons.moreVertical,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          height: 50,
          value: "add",
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
          value: "edit",
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
          value: "delete",
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
}

List<Widget> checkBarActions(deletePhotosFromCollection) {
  return [
    IconButton(
      icon: Icon(EvaIcons.trashOutline),
      onPressed: deletePhotosFromCollection,
    ),
    SizedBox(width: 10.0),
  ];
}

class MyShopCollection extends StatefulWidget {
  final String uid;
  final Collection collection;
  final String title;
  final List<dynamic> photos;
  final VoidCallback deleteCallback;
  final VoidCallback callback;
  final VoidCallback addNewPhotos;
  final VoidCallback reloadCollection;
  MyShopCollection(
      {Key key,
      this.photos,
      this.title,
      this.deleteCallback,
      this.callback,
      this.addNewPhotos,
      this.uid,
      this.collection,
      this.reloadCollection})
      : super(key: key);

  @override
  _MyShopCollectionState createState() => _MyShopCollectionState();
}

class _MyShopCollectionState extends State<MyShopCollection> {
  bool checkBar = false;
  List<dynamic> indexList = new List();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _deletePhotosFromCollection() {
    if (widget.photos.length - indexList.length >= 3) {
      BlocProvider.of<CollectionBloc>(context).add(
        UpdateCollection(
          'delete',
          null,
          indexList,
          collection: widget.collection,
        ),
      );
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 10),
          content: Row(
            children: <Widget>[
              Icon(
                EvaIcons.alertCircleOutline,
                color: Colors.redAccent,
              ),
              SizedBox(width: 10.0),
              Text("Deleting photos..."),
            ],
          ),
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          content: Row(
            children: <Widget>[
              Icon(
                EvaIcons.alertCircleOutline,
                color: Colors.redAccent,
              ),
              SizedBox(width: 10.0),
              Text("Collection can't be less than 3 photos."),
            ],
          ),
        ),
      );
    }
  }

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
    return BlocListener<CollectionBloc, CollectionState>(
      listener: (context, state) {
        if (state is CollectionUpdated) {
          if (state.action == 'delete') {
            widget.reloadCollection();
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
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
            checkBar ? '${indexList.length} selected' : widget.title,
            style: TextStyle(color: Colors.black),
          ),
          actions: checkBar
              ? checkBarActions(_deletePhotosFromCollection)
              : normalActions(
                  context,
                  widget.deleteCallback,
                  widget.callback,
                  widget.addNewPhotos,
                ),
        ),
        body: new GridView.count(
            padding: const EdgeInsets.all(16.0),
            primary: false,
            childAspectRatio: 0.61,
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(widget.photos.length, (index) {
              return _Tile(
                photo: widget.photos[index].toString(),
                checkBarEnabled: checkBar,
                active: indexList.contains(widget.photos[index].toString()),
                callback: () {
                  longPress(widget.photos[index].toString());
                },
              );
            })),
      ),
    );
  }
}

class _Tile extends StatefulWidget {
  final String photo;
  final bool checkBarEnabled;
  final bool active;
  final VoidCallback callback;
  _Tile({Key key, this.checkBarEnabled, this.callback, this.active, this.photo})
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
              child: Image.network(
                widget.photo,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
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
                              " 0",
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
