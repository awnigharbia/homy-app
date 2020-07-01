import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop_repository/shop_repository.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository _collectionRepository;

  CollectionBloc({@required CollectionFirebase collectionFirebase})
      : assert(collectionFirebase != null),
        _collectionRepository = collectionFirebase;

  @override
  CollectionState get initialState => CollectionLoading();

  @override
  Stream<CollectionState> mapEventToState(
    CollectionEvent event,
  ) async* {
    if (event is LoadCollection) {
      yield* _mapLoadCollectionToState(event.uid);
    } else if (event is CreateCollection) {
      yield* _mapCreateCollectionToState(event.collection, event.actions);
    } else if (event is UpdateCollection) {
      yield* _mapUpdateCollectionToState(
        event.collection,
        event.photos,
        event.deletePhotos,
        event.actions,
      );
    } else if (event is DeleteCollection) {
      yield* _mapDeleteCollectionToState(event.collectionId, event.photos);
    }
  }

  Stream<CollectionState> _mapLoadCollectionToState(String uid) async* {
    try {
      final collections = await _collectionRepository.getCollection(uid);
      yield CollectionLoaded(collections: collections);
    } catch (_) {
      yield CollectionNotLoaded();
    }
  }

  Stream<CollectionState> _mapCreateCollectionToState(
      Collection collection, String actions) async* {
    try {
      await _collectionRepository.createNewCollection(collection, actions);
      yield CollectionAdded();
    } catch (_) {
      yield CollectionNotAdded();
    }
  }

  Stream<CollectionState> _mapUpdateCollectionToState(Collection collection,
      List<dynamic> photos, List<dynamic> deletePhotos, actions) async* {
    try {
      await _collectionRepository.updateCollection(
          collection, photos, deletePhotos, actions);
      yield CollectionUpdated(action: actions);
    } catch (_) {
      yield CollectionNotUpdated();
    }
  }

  Stream<CollectionState> _mapDeleteCollectionToState(
      String collectionId, List<dynamic> photos) async* {
    try {
      await _collectionRepository.deleteCollection(collectionId, photos);
      yield CollectionDeleted();
    } catch (_) {
      yield CollectionNotDeleted();
    }
  }
}
