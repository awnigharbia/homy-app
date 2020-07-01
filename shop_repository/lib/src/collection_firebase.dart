import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:shop_repository/src/collection_repository.dart';
import 'package:shop_repository/src/entities/collection_entity.dart';

class CollectionFirebase implements CollectionRepository {
  final collectionRef = Firestore.instance.collection("collection");

  @override
  Future<void> createNewCollection(
      Collection collection, String actions) async {
    List<dynamic> photos;
    if (actions == 'upload') {
      photos = await FirebaseShopRepository()
          .uploadImageToFirebase(collection.authorId, collection.photos);
    }

    return actions == 'upload'
        ? collectionRef
            .add(collection.copyWith(photos: photos).toEntity().toDocument())
        : collectionRef.add(collection.toEntity().toDocument());
  }

  @override
  Future<void> deleteCollection(
      String collectionId, List<dynamic> downUrl) async {
    await FirebaseShopRepository().deletePhotos(downUrl);
    return collectionRef.document(collectionId).delete();
  }

  @override
  Future<List<Collection>> getCollection(String uid) async {
    final result =
        await collectionRef.where("authorId", isEqualTo: uid).getDocuments();

    return uid != null
        ? result.documents
            .map((e) => Collection.fromEntity(CollectionEntity.fromSnapshot(e)))
            .toList()
        : null;
  }

  @override
  Future<void> updateCollection(Collection collection, List<AssetEntity> photos,
      List<dynamic> deletePhotos, String actions) async {
    if (actions == 'add') {
      final newPhotos = await FirebaseShopRepository()
          .uploadImageToFirebase(collection.authorId, photos);

      final updatedPhotos = collection.photos + newPhotos;

      return collectionRef.document(collection.id).updateData(
          collection.copyWith(photos: updatedPhotos).toEntity().toDocument());
    } else if (actions == 'delete') {
      print(collection);
      await FirebaseShopRepository().deletePhotos(deletePhotos);
      final updatedPhotos = List.from(collection.photos
          .where((element) => !deletePhotos.contains(element)));
      print(updatedPhotos);
      return collectionRef.document(collection.id).updateData(
          collection.copyWith(photos: updatedPhotos).toEntity().toDocument());
    } else if (actions == 'name') {
      return collectionRef
          .document(collection.id)
          .updateData(collection.toEntity().toDocument());
    }

    return null;
  }
}
