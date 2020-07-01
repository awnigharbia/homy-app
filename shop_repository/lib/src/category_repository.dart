import 'package:shop_repository/shop_repository.dart';

abstract class CategoryRepository {
  Future<void> createNewCategory(Category category);

  Future<void> deleteCategory(String categoryId);

  Future<void> updateCategory(
    Category category,
  );

  Stream<List<Category>> categories(String uid);
}
