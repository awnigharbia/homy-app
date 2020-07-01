import 'package:shop_repository/src/entities/category_entity.dart';

class Category {
  final String id;
  final String name;
  final String authorId;

  Category({
    this.id,
    this.name,
    this.authorId,
  });

  Category copyWith({
    String id,
    String name,
    String authorId,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      authorId: authorId ?? this.authorId,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      authorId: authorId,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      id: entity.id,
      name: entity.name,
      authorId: entity.authorId,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Category &&
        o.id == id &&
        o.name == name &&
        o.authorId == authorId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ authorId.hashCode;
}
