import 'package:shop_repository/src/entities/entities.dart';
import 'model.dart';
import 'package:meta/meta.dart';

@immutable
class Shop {
  final String id;
  final String shopName;
  final String shopDescription;
  final String shopPhone;
  final String shopLocation;
  final String shopType;
  final String shopPicture;
  final String shopCover;
  final String ownerId;
  final int rate;
  final List<dynamic> product;
  final List<String> shopCategories;
  final List<String> shopCollections;
  final List<String> shopFollowers;
  final List<String> notifiedFollowers;

  Shop({
    String id,
    @required this.shopName,
    this.shopDescription = '',
    this.shopPhone = '',
    this.shopLocation = '',
    @required this.shopType,
    @required this.ownerId,
    this.shopPicture = '',
    this.shopCover = '',
    this.rate = 0,
    this.product,
    this.shopCategories,
    this.shopCollections,
    this.shopFollowers,
    this.notifiedFollowers,
  }) : this.id = id;

  Shop copyWith({
    String id,
    String shopName,
    String shopDescription,
    String shopPhone,
    String shopLocation,
    String shopType,
    String shopPicture,
    String shopCover,
    String ownerId,
    int rate,
    List<Product> product,
    List<Category> shopCategories,
    List<Collection> shopCollections,
    List<String> shopFollowers,
    List<String> notifiedFollowers,
  }) {
    return Shop(
      id: id ?? this.id,
      shopName: shopName ?? this.shopName,
      shopDescription: shopDescription ?? this.shopDescription,
      shopPhone: shopPhone ?? this.shopPhone,
      shopLocation: shopLocation ?? this.shopLocation,
      shopType: shopType ?? this.shopType,
      shopPicture: shopPicture ?? this.shopPicture,
      shopCover: shopCover ?? this.shopCover,
      rate: rate ?? this.rate,
      product: product ?? this.product,
      shopCategories: shopCategories ?? this.shopCategories,
      shopCollections: shopCollections ?? this.shopCollections,
      shopFollowers: shopFollowers ?? this.shopFollowers,
      notifiedFollowers: notifiedFollowers ?? this.notifiedFollowers,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      shopName.hashCode ^
      shopDescription.hashCode ^
      shopPhone.hashCode ^
      shopLocation.hashCode ^
      shopType.hashCode ^
      shopPicture.hashCode ^
      shopCover.hashCode ^
      rate.hashCode ^
      product.hashCode ^
      shopCategories.hashCode ^
      shopCollections.hashCode ^
      shopFollowers.hashCode ^
      ownerId.hashCode ^
      notifiedFollowers.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Shop &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          shopName == other.shopName &&
          shopDescription == other.shopDescription &&
          shopPhone == other.shopPhone &&
          shopLocation == other.shopLocation &&
          shopType == other.shopType &&
          shopPicture == other.shopPicture &&
          shopCover == other.shopCover &&
          rate == other.rate &&
          product == other.product &&
          shopCategories == other.shopCategories &&
          shopCollections == other.shopCollections &&
          shopFollowers == other.shopFollowers &&
          ownerId == other.ownerId &&
          notifiedFollowers == other.notifiedFollowers;

  @override
  String toString() =>
      "id:$id , ownerID:$ownerId, shopName: $shopName, shopDescription: $shopDescription, shopLocation: $shopLocation, shopPhone: $shopPhone, shopType: $shopType, shopPicture: $shopPicture,  shopCover: $shopCover, rate: $rate, product: $product, shopCategories: $shopCategories, shopCollections: $shopCollections, shopFollowers: $shopFollowers, notifiedFollowers: $notifiedFollowers ";

  ShopEntity toEntity() {
    return ShopEntity(
      id,
      shopName,
      shopDescription,
      shopPhone,
      shopLocation,
      shopType,
      shopPicture,
      shopCover,
      rate,
      product,
      shopCategories,
      shopCollections,
      shopFollowers,
      notifiedFollowers,
      ownerId,
    );
  }

  static Shop fromEntity(ShopEntity entity) {
    return Shop(
      id: entity.id,
      shopName: entity.shopName,
      shopDescription: entity.shopDescription,
      shopPhone: entity.shopPhone,
      shopLocation: entity.shopLocation,
      shopType: entity.shopType,
      shopPicture: entity.shopPicture,
      ownerId: entity.ownerId,
      shopCover: entity.shopCover,
      rate: entity.rate,
      product: entity.product,
      shopCategories: entity.shopCategories,
      shopCollections: entity.shopCollections,
      shopFollowers: entity.shopFollowers,
      notifiedFollowers: entity.notifiedFollowers,
    );
  }
}
