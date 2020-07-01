part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({
    this.products,
  });

  @override
  List<Object> get props => [products];

  @override
  String toString() => "Produts Loaded { $products }";
}

class ProductNotLoaded extends ProductState {}

class ProductDeleted extends ProductState {
  final String productId;
  const ProductDeleted({this.productId});

  @override
  List<Object> get props => [productId];

  @override
  String toString() => "Product deleted: { productId: $productId} }";
}

class ProductNotDeleted extends ProductState {}

class ProductUpdated extends ProductState {}

class ProductNotUpdated extends ProductState {}
