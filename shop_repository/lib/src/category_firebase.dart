import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_repository/src/category_repository.dart';
import 'package:shop_repository/src/entities/category_entity.dart';
import 'package:shop_repository/src/models/category.dart';

class CategoryFirebase implements CategoryRepository {
  final categoryCollection = Firestore.instance.collection("category");

  @override
  Future<void> createNewCategory(Category category) async {
    return await categoryCollection.add(category.toEntity().toDocument());
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    return await categoryCollection.document(categoryId).delete();
  }

  @override
  Stream<List<Category>> categories(String uid) {
    return categoryCollection
        .where('authorId', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map((doc) => Category.fromEntity(CategoryEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateCategory(Category category) async {
    await categoryCollection
        .document(category.id)
        .updateData(category.toEntity().toDocument());
  }
}
