import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:shop_repository/src/entities/entities.dart';

class FirebaseShopRepository implements ShopRepository {
  final shopCollection = Firestore.instance.collection('shops');
  final productCollection = Firestore.instance.collection('product');
  final collectionRef = Firestore.instance.collection('collection');

  @override
  Future<void> createNewShop(Shop shop) {
    return shopCollection.add(shop.toEntity().toDocument());
  }

  @override
  Future<bool> isShopOwner(String uid) async {
    final result =
        await shopCollection.where("ownerId", isEqualTo: uid).getDocuments();

    return result.documents.length != 0;
  }

  Future<List<Shop>> getShopInfo(String uid) async {
    final result =
        await shopCollection.where("ownerId", isEqualTo: uid).getDocuments();

    return uid != null
        ? result.documents
            .map((e) => Shop.fromEntity(ShopEntity.fromSnapshot(e)))
            .toList()
        : null;
  }

  Future<List<Product>> getShopProduct(String uid) async {
    final result = await productCollection
        .where("authorId", isEqualTo: uid)
        .getDocuments();

    return uid != null
        ? result.documents
            .map((e) => Product.fromEntity(ProductEntity.fromSnapshot(e)))
            .toList()
        : null;
  }

  // @override
  // Future<void> deleteTodo(Todo todo) async {
  //   return shopCollection.document(todo.id).delete();
  // }

  // @override
  // Stream<List<Todo>> todos() {
  //   return shopCollection.snapshots().map((snapshot) {
  //     return snapshot.documents
  //         .map((doc) => Todo.fromEntity(TodoEntity.fromSnapshot(doc)))
  //         .toList();
  //   });
  // }

  @override
  Future<void> updateShop(Shop update) {
    return shopCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }

  @override
  Future<void> editShopProduct(Product product) {
    return productCollection
        .document(product.id)
        .updateData(product.toEntity().toDocument());
  }

  Future<void> createNewProduct(Product product) async {
    try {
      final List<dynamic> photos =
          await uploadImageToFirebase(product.authorId, product.photos);

      return productCollection
          .add(product.copyWith(photos: photos).toEntity().toDocument());
    } catch (e) {
      print(e.message);
    }
  }

  // ignore: missing_return
  Future<List> uploadImageToFirebase(
      String authorId, List<AssetEntity> photos) async {
    List<dynamic> uploadUrls = [];

    try {
      await Future.wait(photos.map((entity) async {
        File image = await entity.file;
        int randomNumber = Random().nextInt(100000);
        String imageLocation = '/shops/$authorId/$randomNumber.jpg';

        final StorageReference storageReference =
            FirebaseStorage().ref().child(imageLocation);
        final StorageUploadTask uploadTask = storageReference.putFile(image);
        StorageTaskSnapshot storageTaskSnapshot;

        StorageTaskSnapshot snapshot = await uploadTask.onComplete;
        if (snapshot.error == null) {
          storageTaskSnapshot = snapshot;
          final String downloadUrl =
              await storageTaskSnapshot.ref.getDownloadURL();
          uploadUrls.add(downloadUrl);
        } else {
          throw ("Error with uploading task");
        }
      }));

      return uploadUrls;
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> deletePhotos(List<dynamic> downUrl) async {
    try {
      await Future.wait(downUrl.map((e) async {
        final isInProduct = await productCollection
            .where('photos', arrayContains: e.toString())
            .getDocuments();
        final isInCollection = await collectionRef
            .where('photos', arrayContains: e.toString())
            .getDocuments();
        if (isInProduct.documents.length == 1 ||
            isInCollection.documents.length == 1) {
          final StorageReference storageReference =
              await FirebaseStorage().getReferenceFromUrl(e);

          await storageReference.delete();
        }
      }));
    } catch (_) {
      throw "Cannot be deleted";
    }
  }

  Future<void> deleteShopProduct(
      String productId, List<dynamic> downUrl) async {
    try {
      await deletePhotos(downUrl);
      await productCollection.document(productId).delete();
    } catch (_) {
      throw "Delete error";
    }
  }

  Future<List> getAllImages() async {
    final collections = await collectionRef.getDocuments();
    final products = await productCollection.getDocuments();
    List<dynamic> list = new List();

    final collectionsEntity = collections.documents
        .map(
          (e) => Collection.fromEntity(
            CollectionEntity.fromSnapshot(e),
          ),
        )
        .toList();

    final prodcutsEntity = products.documents
        .map(
          (e) => Product.fromEntity(
            ProductEntity.fromSnapshot(e),
          ),
        )
        .toList();

    collectionsEntity
        .where((element) => element.photos != null)
        .forEach((element) {
      element.photos.forEach((element2) {
        list.add(element2.toString());
      });
    });

    prodcutsEntity
        .where((element) => element.photos != null)
        .forEach((element) {
      element.photos.forEach((element2) {
        list.add(element2.toString());
      });
    });

    return list;
  }
}
