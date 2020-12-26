import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CollectionEntity extends Equatable {
  final String id;
  final String name;
  final List<dynamic> photos;
  final String authorId;

  CollectionEntity({
    this.id,
    this.name,
    this.photos,
    this.authorId,
  });

  @override
  List<Object> get props => [id, name, photos, authorId];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photos': photos,
      'authorId': authorId,
    };
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'photos': photos,
      'authorId': authorId,
    };
  }

  static CollectionEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CollectionEntity(
      id: map['id'],
      name: map['name'],
      photos: map['photos'],
      authorId: map['authorId'],
    );
  }

  String toJson() => json.encode(toMap());

  static CollectionEntity fromJson(String source) =>
      fromMap(json.decode(source));

  static CollectionEntity fromSnapshot(DocumentSnapshot snap) {
    if (snap.data == null) return null;

    return CollectionEntity(
      id: snap.id,
      name: snap.data()['name'],
      photos: snap.data()['photos'],
      authorId: snap.data()['authorId'],
    );
  }

  @override
  String toString() {
    return 'CollectionEntity(id: $id, name: $name, photos: $photos, authorId: $authorId)';
  }
}
