import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String authorId;

  CategoryEntity({
    this.id,
    this.name,
    this.authorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'authorId': authorId,
    };
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'authorId': authorId,
    };
  }

  static CategoryEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryEntity(
      id: map['id'],
      name: map['name'],
      authorId: map['authorId'],
    );
  }

  String toJson() => json.encode(toMap());

  static CategoryEntity fromJson(String source) => fromMap(json.decode(source));

  static CategoryEntity fromSnapshot(DocumentSnapshot snap) {
    if (snap.data == null) return null;

    return CategoryEntity(
      id: snap.id,
      name: snap.data()['name'],
      authorId: snap.data()['authorId'],
    );
  }

  @override
  String toString() =>
      'CategoryEntity(id: $id, name: $name, authorId: $authorId)';

  @override
  List<Object> get props => [name, id, authorId];
}
