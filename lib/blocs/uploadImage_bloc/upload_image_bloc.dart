import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop_repository/shop_repository.dart';

part 'upload_image_event.dart';
part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  final ShopRepository _shopRepository;

  UploadImageBloc({@required ShopRepository shopRepository})
      : assert(shopRepository != null),
        _shopRepository = shopRepository;

  @override
  UploadImageState get initialState => UploadImageInitial();

  @override
  Stream<UploadImageState> mapEventToState(
    UploadImageEvent event,
  ) async* {
    if (event is UploadImage) {
      yield* _mapUploadImageToState(event.product);
    }
    if (event is ClearUploadImage) {
      yield UploadImageInitial();
    }
  }

  Stream<UploadImageState> _mapUploadImageToState(
    Product product,
  ) async* {
    try {
      yield UploadImageProgress();
      await _shopRepository.createNewProduct(product);
      yield UploadImageSuccess();
    } catch (_) {
      yield UploadImageFailure();
    }
  }
}
