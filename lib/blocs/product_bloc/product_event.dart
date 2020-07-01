part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  final String uid;
  LoadProduct({
    this.uid,
  });

  @override
  List<Object> get props => [uid];

  @override
  String toString() => "LoadProduct for {uid: $uid}";
}

class DeleteProduct extends ProductEvent {
  final String productId;
  final List<dynamic> downUrl;
  DeleteProduct({this.productId, this.downUrl});

  @override
  List<Object> get props => [productId, downUrl];

  @override
  String toString() => "Delete product { id: $productId }";
}

class UpdateProduct extends ProductEvent {
  final Product product;

  const UpdateProduct({this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => "Update Product { product: $product } ";
}
