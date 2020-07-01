import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/blocs/collection_bloc/collection_bloc.dart';
import 'package:flutter_firestore_todos/blocs/homy_photos/homy_photos.dart';
import 'package:flutter_firestore_todos/screens/homy_photos/homy_photos.dart';
import 'package:flutter_firestore_todos/screens/imagePicker/image_picker.dart';
import 'package:flutter_firestore_todos/widgets/myShop_widgets/collection/myShop_collection_alertDialouge.dart';
import 'package:flutter_firestore_todos/widgets/myShop_widgets/collection/myShop_collection_snackbar.dart';

import 'package:shop_repository/shop_repository.dart';

import 'myShop_collection_header.dart';
import 'myShop_collection_list.dart';

class MyShopCollections extends StatelessWidget {
  const MyShopCollections({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated)
        return BlocProvider<CollectionBloc>(
          create: (context) => CollectionBloc(
            collectionFirebase: CollectionFirebase(),
          )..add(LoadCollection(uid: state.user.id)),
          child: MyShopCollectionsProvided(uid: state.user.id),
        );

      return SizedBox();
    });
  }
}

class MyShopCollectionsProvided extends StatefulWidget {
  final String uid;
  MyShopCollectionsProvided({Key key, this.uid}) : super(key: key);

  @override
  _MyShopCollectionsProvidedState createState() =>
      _MyShopCollectionsProvidedState();
}

class _MyShopCollectionsProvidedState extends State<MyShopCollectionsProvided> {
  final _collectionNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _createNewCollection(selectedImages) {
      BlocProvider.of<CollectionBloc>(context).add(
        CreateCollection(
          collection: Collection(
            name: _collectionNameController.text,
            photos: selectedImages,
            authorId: widget.uid,
          ),
          actions: 'upload',
        ),
      );
    }

    void _refresh() {
      BlocProvider.of<CollectionBloc>(context)
          .add(LoadCollection(uid: widget.uid));
    }

    void _saveChanges() {
      if (_formKey.currentState.validate())
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BlocBuilder<SelectedImagesBloc, SelectedImagesState>(
                    builder: (context, state) {
              return ImagePick(
                  maxSelect: 100,
                  callback: () {
                    _createNewCollection(
                        (state as SelectedImages).selectedImages);
                  });
            }),
          ),
        );
    }

    void _uploadFromHomyPhotos() {
      if (_formKey.currentState.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HomyPhotosBloc(
                    shopRepository: FirebaseShopRepository(),
                  )..add(LoadHomyPhotos()),
                ),
                BlocProvider(
                  create: (context) => CollectionBloc(
                    collectionFirebase: CollectionFirebase(),
                  ),
                )
              ],
              child: HomyPhotos(
                uid: widget.uid,
                collectionName: _collectionNameController.text,
                refresh: _refresh,
              ),
            ),
          ),
        );
      }
    }

    void _saveEditedName(Collection collection) {
      BlocProvider.of<CollectionBloc>(context).add(
        UpdateCollection(
          'name',
          null,
          null,
          collection: collection.copyWith(name: _collectionNameController.text),
        ),
      );
      _collectionNameController.text = '';
      Navigator.pop(context);
    }

    Future<void> _showCollectionDialouge(String uploadType) async {
      Navigator.pop(context);
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CreateCollectionDialouge(
            formKey: _formKey,
            collectionNameController: _collectionNameController,
            saveChanges:
                uploadType == 'local' ? _saveChanges : _uploadFromHomyPhotos,
            edit: false,
          );
        },
      );
    }

    Future<void> _showEditCollectionDialouge(Collection collection) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CreateCollectionDialouge(
            formKey: _formKey,
            collectionNameController: _collectionNameController,
            saveChanges: () {
              _saveEditedName(collection);
            },
            edit: true,
          );
        },
      );
    }

    return SafeArea(
      top: false,
      bottom: false,
      child: BlocListener<CollectionBloc, CollectionState>(
        listener: (context, state) {
          if (state is CollectionAdded) {
            showSnackbar(context, " Collection added successfully.",
                EvaIcons.checkmarkCircle2, Colors.green[800]);
            BlocProvider.of<CollectionBloc>(context)
                .add(LoadCollection(uid: widget.uid));
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          }

          if (state is CollectionDeleted) {
            showSnackbar(context, " Collection deleted.",
                EvaIcons.checkmarkCircle2, Colors.green[800]);

            BlocProvider.of<CollectionBloc>(context)
                .add(LoadCollection(uid: widget.uid));
          }

          if (state is CollectionUpdated) {
            showSnackbar(context, " Collection updated.",
                EvaIcons.checkmarkCircle2, Colors.green[800]);

            BlocProvider.of<CollectionBloc>(context)
                .add(LoadCollection(uid: widget.uid));

            if (state.action == 'add') {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            }
          }
        },
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                MyShopCollectionHeader(),
                MyShopCollectionList(
                  uid: widget.uid,
                  showCollectionDialouge: _showCollectionDialouge,
                  showEditCollectionDialouge: _showEditCollectionDialouge,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
