import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop_repository/shop_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ShopRepository _shopRepository;

  ProductBloc({@required ShopRepository shopRepository})
      : assert(shopRepository != null),
        _shopRepository = shopRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProduct) {
      yield* _mapLoadProductToState(event.uid);
    } else if (event is DeleteProduct) {
      yield* _mapDeleteProductToState(event.productId, event.downUrl);
    } else if (event is UpdateProduct) {
      yield* _mapUpdateProductToState(event.product);
    }
  }

  Stream<ProductState> _mapUpdateProductToState(Product product) async* {
    try {
      await _shopRepository.editShopProduct(product);
      yield ProductUpdated();
    } catch (_) {
      yield ProductNotUpdated();
    }
  }

  Stream<ProductState> _mapDeleteProductToState(
      String productId, List<dynamic> downUrl) async* {
    try {
      await _shopRepository.deleteShopProduct(productId, downUrl);
      yield ProductDeleted(productId: productId);
    } catch (_) {
      yield ProductNotDeleted();
    }
  }

  Stream<ProductState> _mapLoadProductToState(String uid) async* {
    try {
      final products = await _shopRepository.getShopProduct(uid);
      yield ProductLoaded(products: products);
    } catch (_) {
      yield ProductNotLoaded();
    }
  }
}
