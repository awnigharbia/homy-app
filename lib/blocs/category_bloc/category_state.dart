import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<dynamic> categories;
  CategoryLoaded({
    this.categories,
  });

  @override
  List<Object> get props => [categories];

  @override
  String toString() => 'CategoryLoaded(categories: $categories)';
}

class CategoryNotLoaded extends CategoryState {}

class CategoryAdded extends CategoryState {}

class CategoryNotAdded extends CategoryState {}

class CategoryUpdated extends CategoryState {}

class CategoryNotUpdated extends CategoryState {}

class CategoryDeleted extends CategoryState {}

class CategoryNotDeleted extends CategoryState {}
