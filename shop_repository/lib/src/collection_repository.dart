import 'package:photo_manager/photo_manager.dart';
import 'package:shop_repository/shop_repository.dart';

abstract class CollectionRepository {
  Future<void> createNewCollection(Collection collection, String actions);

  Future<void> deleteCollection(String collectionId, List<dynamic> downUrl);

  Future<void> updateCollection(
    Collection collection,
    List<AssetEntity> photos,
    List<dynamic> deletePhotos,
    String action,
  );

  Future<List<Collection>> getCollection(String uid);
}
