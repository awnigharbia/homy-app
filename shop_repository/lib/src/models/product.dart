

import 'package:flutter/foundation.dart';
import 'package:shop_repository/src/entities/entities.dart';

class Product {
  final String id;
  final String description;
  final String category;
  final List<dynamic> photos;
  final List<dynamic> sizes;
  final int price;
  final int offerPrice;
  final int inStock;
  final String authorId;

  Product({
    String id,
    this.description,
    this.category,
    this.photos,
    this.sizes,
    this.price,
    this.offerPrice,
    this.inStock,
    this.authorId,
  }) : this.id = id;

  Product copyWith({
    String id,
    String description,
    String category,
    List<dynamic> photos,
    List<dynamic> sizes,
    int price,
    int offerPrice,
    int inStock,
    String authorId,
  }) {
    return Product(
      id: id ?? this.id,
      description: description ?? this.description,
      category: category ?? this.category,
      photos: photos ?? this.photos,
      sizes: sizes ?? this.sizes,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      inStock: inStock ?? this.inStock,
      authorId: authorId ?? this.authorId,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.id == id &&
        o.description == description &&
        o.category == category &&
        listEquals(o.photos, photos) &&
        listEquals(o.sizes, sizes) &&
        o.price == price &&
        o.offerPrice == offerPrice &&
        o.inStock == inStock &&
        o.authorId == authorId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        category.hashCode ^
        photos.hashCode ^
        sizes.hashCode ^
        price.hashCode ^
        offerPrice.hashCode ^
        inStock.hashCode ^
        authorId.hashCode;
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      description: description,
      inStock: inStock,
      sizes: sizes,
      price: price,
      offerPrice: offerPrice,
      authorId: authorId,
      category: category,
      photos: photos,
    );
  }

  static Product fromEntity(ProductEntity entity) {
    return Product(
      id: entity.id,
      description: entity.description,
      inStock: entity.inStock,
      sizes: entity.sizes,
      price: entity.price,
      offerPrice: entity.offerPrice,
      authorId: entity.authorId,
      category: entity.category,
      photos: entity.photos,
    );
  }
}
