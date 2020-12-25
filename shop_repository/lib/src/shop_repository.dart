import 'dart:async';

import 'package:photo_manager/photo_manager.dart';
import 'package:shop_repository/shop_repository.dart';

abstract class ShopRepository {
  Future<void> createNewShop(Shop shop);

  Future<void> updateShop(Shop shop);

  Future<List<Shop>> getShopInfo(String uid);

  Future<bool> isShopOwner(String uid);

  Future<void> createNewProduct(Product product);

  Future<List<Product>> getShopProduct(String uid);

  Future<void> deleteShopProduct(String productId, List<dynamic> downUrl);

  Future<void> editShopProduct(Product product);

  Future<List> uploadImageToFirebase(String authorId, List<AssetEntity> photos);

  Future<List> getAllImages();
}
