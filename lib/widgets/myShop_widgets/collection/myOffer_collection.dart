import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/collection_bloc/collection_bloc.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:shop_repository/shop_repository.dart';

class MyShopOfferCollection extends StatelessWidget {
  final String uid;
  final String id;
  final String title;
  final Collection collection;
  final int discount;
  final List<dynamic> photos;
  final VoidCallback callback;
  final VoidCallback addNewPhotos;
  final VoidCallback reloadCollection;

  const MyShopOfferCollection({
    Key key,
    this.title,
    this.discount,
    this.photos,
    this.id,
    this.callback,
    this.addNewPhotos,
    this.uid,
    this.collection,
    this.reloadCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _deleteCallback() {
      BlocProvider.of<CollectionBloc>(context).add(DeleteCollection(
        collectionId: id,
        photos: photos,
      ));
    }

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<CollectionBloc>(
                  create: (context) => CollectionBloc(
                    collectionFirebase: CollectionFirebase(),
                  ),
                  child: MyShopCollection(
                    uid: uid,
                    title: title,
                    photos: photos,
                    deleteCallback: _deleteCallback,
                    callback: callback,
                    addNewPhotos: addNewPhotos,
                    collection: collection,
                    reloadCollection: reloadCollection,
                  ),
                ),
              ),
            );
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
                                photos[0].toString(),
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
                                      photos[1].toString(),
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
                                      photos[2].toString(),
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
                                      "${photos.length} items",
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
                      onSelected: (value) {
                        if (value == 'delete') {
                          _deleteCallback();
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
                        EvaIcons.moreHorizotnalOutline,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
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
