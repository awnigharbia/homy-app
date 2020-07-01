import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/collection_bloc/collection_bloc.dart';
import 'package:flutter_firestore_todos/blocs/homy_photos/homy_photos.dart';
import 'package:shop_repository/shop_repository.dart';

class HomyPhotos extends StatefulWidget {
  final String collectionName;
  final String uid;
  final VoidCallback refresh;
  HomyPhotos({Key key, this.collectionName, this.uid, this.refresh})
      : super(key: key);

  @override
  _HomyPhotosState createState() => _HomyPhotosState();
}

class _HomyPhotosState extends State<HomyPhotos> {
  bool checkBar = false;
  List<dynamic> indexList = new List();

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
    return Scaffold(
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
          checkBar ? '${indexList.length} selected' : 'Choose Homy photos',
          style: TextStyle(color: Colors.black),
        ),
        actions: checkBar
            ? [
                FlatButton(
                  onPressed: () {
                    if (indexList.length >= 3) {
                      BlocProvider.of<CollectionBloc>(context).add(
                        CreateCollection(
                          actions: 'local',
                          collection: Collection(
                            authorId: widget.uid,
                            name: widget.collectionName,
                            photos: indexList,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ]
            : null,
      ),
      body: BlocListener<CollectionBloc, CollectionState>(
        listener: (context, state) {
          if (state is CollectionAdded) {
            widget.refresh();
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          }
        },
        child: BlocBuilder<HomyPhotosBloc, HomyPhotosState>(
          builder: (context, state) {
            if (state is HomyPhotosLoaded) {
              return new GridView.count(
                padding: const EdgeInsets.all(16.0),
                primary: false,
                childAspectRatio: 1,
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: List.generate(
                  state.photos.length,
                  (index) {
                    return _Tile(
                      photo: state.photos[index].toString(),
                      checkBarEnabled: checkBar,
                      active:
                          indexList.contains(state.photos[index].toString()),
                      callback: () {
                        longPress(state.photos[index].toString());
                      },
                    );
                  },
                ),
              );
            }

            return CircularProgressIndicator();
          },
        ),
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
        onTap: () {
          setState(() {
            selected = !selected;
          });
          widget.callback();
        },
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.photo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
