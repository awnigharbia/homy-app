import 'package:equatable/equatable.dart';
import 'package:shop_repository/shop_repository.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {
  final String uid;
  LoadCategories({
    this.uid,
  });

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'LoadCategories(uid: $uid)';
}

class AddCategory extends CategoryEvent {
  final Category category;

  AddCategory({
    this.category,
  });

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'AddCategory(category: $category)';
}

class UpdateCategory extends CategoryEvent {
  final Category updatedCategory;

  UpdateCategory({
    this.updatedCategory,
  });

  @override
  List<Object> get props => [updatedCategory];

  @override
  String toString() => 'UpdateCategory(updatedCategory: $updatedCategory)';
}

class DeleteCategory extends CategoryEvent {
  final Category category;

  DeleteCategory({
    this.category,
  });

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'DeleteCategory(category: $category)';
}

class CategoriesUpdated extends CategoryEvent {
  final List<Category> categories;
  CategoriesUpdated({
    this.categories,
  });

  @override
  List<Object> get props => [categories];

  @override
  String toString() => 'CategoriesUpdated(categories: $categories)';
}
