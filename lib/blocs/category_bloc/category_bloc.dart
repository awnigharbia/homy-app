import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_firestore_todos/blocs/category_bloc/bloc.dart';
import 'package:shop_repository/shop_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription _categorySubscription;

  CategoryBloc({@required CategoryRepository categoryRepository})
      : assert(categoryRepository != null),
        _categoryRepository = categoryRepository;

  @override
  CategoryState get initialState => CategoryLoading();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState(event.uid);
    } else if (event is AddCategory) {
      yield* _mapAddCategoryToState(event.category);
    } else if (event is UpdateCategory) {
      yield* _mapUpdateCategoryToState(event.updatedCategory);
    } else if (event is DeleteCategory) {
      yield* _mapDeleteCategoryToState(event.category);
    }
  }

  Stream<CategoryState> _mapLoadCategoriesToState(String uid) async* {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.categories(uid).listen(
          (categories) => add(CategoriesUpdated(categories: categories)),
        );
  }

  Stream<CategoryState> _mapAddCategoryToState(Category category) async* {
    try {
      _categoryRepository.createNewCategory(category);
      yield CategoryAdded();
    } catch (_) {
      yield CategoryNotAdded();
    }
  }

  Stream<CategoryState> _mapUpdateCategoryToState(Category category) async* {
    try {
      _categoryRepository.updateCategory(category);
      yield CategoryUpdated();
    } catch (_) {
      yield CategoryNotUpdated();
    }
  }

  Stream<CategoryState> _mapDeleteCategoryToState(Category category) async* {
    try {
      _categoryRepository.deleteCategory(category.id);
      yield CategoryDeleted();
    } catch (_) {
      yield CategoryNotDeleted();
    }
  }
}
