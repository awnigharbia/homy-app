import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/homy_photos/homy_photos.dart';
import 'package:meta/meta.dart';
import 'package:shop_repository/shop_repository.dart';

class HomyPhotosBloc extends Bloc<HomyPhotosEvent, HomyPhotosState> {
  final ShopRepository _shopRepository;

  HomyPhotosBloc({@required ShopRepository shopRepository})
      : assert(shopRepository != null),
        _shopRepository = shopRepository;

  @override
  HomyPhotosState get initialState => HomyPhotosLoading();

  @override
  Stream<HomyPhotosState> mapEventToState(HomyPhotosEvent event) async* {
    if (event is LoadHomyPhotos) {
      yield* _mapLoadHomyPhotosToState();
    }
  }

  Stream<HomyPhotosState> _mapLoadHomyPhotosToState() async* {
    try {
      final photos = await _shopRepository.getAllImages();
      yield HomyPhotosLoaded(photos: photos);
    } catch (_) {
      yield HomyPhotosNotLoaded();
    }
  }
}
