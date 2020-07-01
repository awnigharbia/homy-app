import 'package:equatable/equatable.dart';

abstract class HomyPhotosState extends Equatable {
  const HomyPhotosState();

  @override
  List<Object> get props => [];
}

class HomyPhotosLoading extends HomyPhotosState {}

class HomyPhotosLoaded extends HomyPhotosState {
  final List<dynamic> photos;

  const HomyPhotosLoaded({this.photos});

  @override
  List<Object> get props => [photos];

  @override
  String toString() => 'HomyPhotosLoaded { photos: $photos }';
}

class HomyPhotosNotLoaded extends HomyPhotosState {}
