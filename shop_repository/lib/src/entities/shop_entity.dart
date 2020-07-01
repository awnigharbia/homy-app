import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ShopEntity extends Equatable {
  final String id;
  final String shopName;
  final String shopDescription;
  final String shopLocation;
  final String shopPhone;
  final String shopType;
  final String shopPicture;
  final String shopCover;
  final String ownerId;
  final int rate;
  final List<String> product;
  final List<String> shopCategories;
  final List<String> shopCollections;
  final List<String> shopFollowers;
  final List<String> notifiedFollowers;

  ShopEntity(
    this.id,
    this.shopName,
    this.shopDescription,
    this.shopPhone,
    this.shopLocation,
    this.shopType,
    this.shopPicture,
    this.shopCover,
    this.rate,
    this.product,
    this.shopCategories,
    this.shopCollections,
    this.shopFollowers,
    this.notifiedFollowers,
    this.ownerId,
  );

  @override
  List<Object> get props => [
        id,
        shopName,
        shopDescription,
        shopPhone,
        shopLocation,
        shopType,
        shopCover,
        shopPicture,
        shopCategories,
        shopCollections,
        product,
        rate,
        shopFollowers,
        notifiedFollowers,
        ownerId,
      ];

  @override
  String toString() {
    return 'ShopEntity { ownerID:$ownerId, shopName:$shopName, shopdescription:$shopDescription, shopLocation: $shopLocation, shopPhone:$shopPhone, products:$product, shopType:$shopType, rate: $rate, shopCollection:$shopCollections, shopCategories: $shopCategories, shopPicture:$shopPicture, shopCover:$shopCover }';
  }

  static ShopEntity fromJson(Map<String, Object> json) {
    return ShopEntity(
      json["id"] as String,
      json["shopName"] as String,
      json["shopDescription"] as String,
      json["shopPhone"] as String,
      json["shopLocation"] as String,
      json["shopType"] as String,
      json["shopPicture"] as String,
      json["shopCover"] as String,
      json["rate"] as int,
      json["products"] as List<String>,
      json["shopCategories"] as List<String>,
      json["shopCollections"] as List<String>,
      json["shopFollowers"] as List<String>,
      json["notifiedFollowers"] as List<String>,
      json['ownerId'] as String,
    );
  }

  static ShopEntity fromSnapshot(DocumentSnapshot snap) {
    return ShopEntity(
      snap.documentID,
      snap.data['shopName'],
      snap.data['shopDescription'],
      snap.data['shopPhone'],
      snap.data['shopLocation'],
      snap.data['shopType'],
      snap.data['shopPicture'],
      snap.data['shopCover'],
      snap.data['rate'],
      snap.data['products'],
      snap.data['shopCategories'],
      snap.data['shopCollections'],
      snap.data['shopFollowers'],
      snap.data['notifiedFollowers'],
      snap.data['ownerId'],
    );
  }

  Map<String, Object> toJson() {
    return {
      "shopName": shopName,
      "shopDescription": shopDescription,
      "shopPhone": shopPhone,
      "shopLocation": shopLocation,
      "shopType": shopType,
      "shopPicture": shopPicture,
      "shopCover": shopCover,
      "rate": rate,
      "products": product,
      "shopCategories": shopCategories,
      "shopCollections": shopCollections,
      "shopFollowers": shopFollowers,
      "notifiedFollowers": notifiedFollowers,
      'ownerId': ownerId
    };
  }

  Map<String, Object> toDocument() {
    return {
      "shopName": shopName,
      "shopDescription": shopDescription,
      "shopPhone": shopPhone,
      "shopLocation": shopLocation,
      "shopType": shopType,
      "shopPicture": shopPicture,
      "shopCover": shopCover,
      "rate": rate,
      "products": product,
      "shopCategories": shopCategories,
      "shopCollections": shopCollections,
      "shopFollowers": shopFollowers,
      "notifiedFollowers": notifiedFollowers,
      'ownerId': ownerId,
    };
  }
}
