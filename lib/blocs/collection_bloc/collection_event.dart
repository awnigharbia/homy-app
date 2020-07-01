part of 'collection_bloc.dart';

@immutable
abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class LoadCollection extends CollectionEvent {
  final String uid;
  LoadCollection({
    this.uid,
  });

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'LoadCollection(uid: $uid)';
}

class CreateCollection extends CollectionEvent {
  final Collection collection;
  final String actions;
  CreateCollection({
    this.collection,
    this.actions,
  });

  @override
  List<Object> get props => [collection, actions];

  @override
  String toString() =>
      'CreateCollection(collection: $collection, actions: $actions)';
}

class DeleteCollection extends CollectionEvent {
  final String collectionId;
  final List<dynamic> photos;

  DeleteCollection({
    this.collectionId,
    this.photos,
  });

  @override
  List<Object> get props => [collectionId, photos];

  @override
  String toString() => 'DeleteCollection(collectionId: $collectionId)';
}

class UpdateCollection extends CollectionEvent {
  final Collection collection;
  final String actions;
  final List<dynamic> photos;
  final List<dynamic> deletePhotos;

  UpdateCollection(
    this.actions,
    this.photos,
    this.deletePhotos, {
    this.collection,
  });

  @override
  List<Object> get props => [collection, actions, photos, deletePhotos];

  @override
  String toString() {
    return 'UpdateCollection(collection: $collection, actions: $actions, photos: $photos, deletePhotos: $deletePhotos)';
  }
}
