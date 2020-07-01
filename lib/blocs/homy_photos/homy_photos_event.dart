import 'package:equatable/equatable.dart';

abstract class HomyPhotosEvent extends Equatable {
  const HomyPhotosEvent();

  @override
  List<Object> get props => [];
}

class LoadHomyPhotos extends HomyPhotosEvent {}
