import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String description;
  final String category;
  final List<dynamic> photos;
  final List<String> sizes;
  final int price;
  final int offerPrice;
  final int inStock;
  final String authorId;

  ProductEntity({
    this.id,
    this.description,
    this.category,
    this.photos,
    this.sizes,
    this.price,
    this.offerPrice,
    this.inStock,
    this.authorId,
  });

  @override
  List<Object> get props => [
        id,
        description,
        category,
        photos,
        sizes,
        price,
        offerPrice,
        inStock,
        authorId,
      ];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'description': description,
      'category': category,
      'photos': photos,
      'sizes': sizes,
      'price': price,
      'offerPrice': offerPrice,
      'inStock': inStock,
      'authorId': authorId
    };
  }

  Map<String, Object> toDocument() {
    return {
      'description': description,
      'category': category,
      'photos': photos,
      'sizes': sizes,
      'price': price,
      'offerPrice': offerPrice,
      'inStock': inStock,
      'authorId': authorId
    };
  }

  static ProductEntity fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return ProductEntity(
      id: map['id'],
      description: map['description'],
      category: map['category'],
      photos: List<String>.from(map['photos']),
      sizes: List<String>.from(map['sizes']),
      price: map['price'],
      offerPrice: map['offerPrice'],
      inStock: map['inStock'],
      authorId: map['authorId'],
    );
  }

  static ProductEntity fromSnapshot(DocumentSnapshot snap) {
    if (snap.data == null) return null;

    return ProductEntity(
      id: snap.documentID,
      description: snap.data['description'],
      category: snap.data['category'],
      photos: snap.data['photos'],
      sizes: snap.data['sizes'],
      price: snap.data['price'],
      offerPrice: snap.data['offerPrice'],
      inStock: snap.data['inStock'],
      authorId: snap.data['authorId'],
    );
  }

  String toJson() => json.encode(toMap());

  static ProductEntity fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductEntity(id: $id, description: $description, category: $category, photos: $photos, sizes: $sizes, price: $price, offerPrice: $offerPrice, inStock: $inStock, authorId:$authorId)';
  }
}
