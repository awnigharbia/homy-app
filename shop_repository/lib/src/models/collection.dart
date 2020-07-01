import 'package:flutter/foundation.dart';
import 'package:shop_repository/src/entities/collection_entity.dart';

class Collection {
  final String id;
  final String name;
  final List<dynamic> photos;
  final String authorId;

  Collection({
    String id,
    this.name,
    this.photos,
    this.authorId,
  }) : this.id = id;

  Collection copyWith({
    String id,
    String name,
    List<dynamic> photos,
    String authorId,
  }) {
    return Collection(
      id: id ?? this.id,
      name: name ?? this.name,
      photos: photos ?? this.photos,
      authorId: authorId ?? this.authorId,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Collection &&
        o.id == id &&
        o.name == name &&
        listEquals(o.photos, photos) &&
        o.authorId == authorId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ photos.hashCode ^ authorId.hashCode;
  }

  CollectionEntity toEntity() {
    return CollectionEntity(
      id: id,
      name: name,
      photos: photos,
      authorId: authorId,
    );
  }

  static Collection fromEntity(CollectionEntity entity) {
    return Collection(
      id: entity.id,
      name: entity.name,
      photos: entity.photos,
      authorId: entity.authorId,
    );
  }
}
