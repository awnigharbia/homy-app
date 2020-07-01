part of 'collection_bloc.dart';

@immutable
abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionLoading extends CollectionState {}

class CollectionLoaded extends CollectionState {
  final List<Collection> collections;

  CollectionLoaded({
    this.collections,
  });

  @override
  List<Object> get props => [collections];

  @override
  String toString() => 'CollectionLoaded(collections: $collections)';
}

class CollectionAdded extends CollectionState {}

class CollectionNotAdded extends CollectionState {}

class CollectionNotLoaded extends CollectionState {}

class CollectionUpdated extends CollectionState {
  final String action;
  CollectionUpdated({
    this.action,
  });

  @override
  List<Object> get props => [action];

  @override
  String toString() => 'CollectionUpdated(action: $action)';
}

class CollectionNotUpdated extends CollectionState {}

class CollectionDeleted extends CollectionState {}

class CollectionNotDeleted extends CollectionState {}
