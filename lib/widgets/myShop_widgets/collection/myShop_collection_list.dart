import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/blocs/collection_bloc/collection_bloc.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shop_repository/shop_repository.dart';

import 'myOffer_collection.dart';
import 'myShopCollection_newCollection.dart';
import 'myShop_collection_bottomModal.dart';

class MyShopCollectionList extends StatelessWidget {
  final String uid;
  final dynamic showCollectionDialouge;
  final dynamic showEditCollectionDialouge;
  const MyShopCollectionList(
      {Key key,
      this.showCollectionDialouge,
      this.uid,
      this.showEditCollectionDialouge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _saveNewPhotosToCollection(
        List<AssetEntity> selectedImages, Collection collection) {
      BlocProvider.of<CollectionBloc>(context).add(
        UpdateCollection('add', selectedImages, null, collection: collection),
      );

      BlocProvider.of<CollectionBloc>(context).add(
        LoadCollection(uid: uid),
      );
    }

    void _reloadCollection() {
      BlocProvider.of<CollectionBloc>(context).add(
        LoadCollection(uid: uid),
      );
    }

    void _addNewPhotos(Collection collection) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BlocBuilder<SelectedImagesBloc, SelectedImagesState>(
                  builder: (context, state) {
            return ImagePick(
                maxSelect: 100,
                callback: () {
                  _saveNewPhotosToCollection(
                      (state as SelectedImages).selectedImages, collection);
                });
          }),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      sliver: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (context, state) {
          if (state is CollectionLoaded)
            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return MyShopCollectionNewCollection(onTap: () {
                      bottomModal(
                        context,
                        showCollectionDialouge,
                      );
                    });
                  }

                  return MyShopOfferCollection(
                      uid: uid,
                      collection: state.collections[index - 1],
                      id: state.collections[index - 1].id,
                      title: state.collections[index - 1].name,
                      photos: state.collections[index - 1].photos,
                      reloadCollection: _reloadCollection,
                      addNewPhotos: () {
                        _addNewPhotos(state.collections[index - 1]);
                      },
                      callback: () {
                        showEditCollectionDialouge(
                            state.collections[index - 1]);
                      });
                },
                childCount: state.collections.length == null ||
                        state.collections.length == 0
                    ? 1
                    : state.collections.length + 1,
              ),
            );

          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
