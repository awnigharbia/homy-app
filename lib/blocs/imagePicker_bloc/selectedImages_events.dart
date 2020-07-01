import 'package:equatable/equatable.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class SelectedImagesEvent extends Equatable {
  const SelectedImagesEvent();

  @override
  List<Object> get props => [];
}

class ClearSelected extends SelectedImagesEvent {}

class SelectImage extends SelectedImagesEvent {
  final List<AssetEntity> entity;

  const SelectImage(this.entity);

  @override
  List<Object> get props => [entity];

  @override
  String toString() => "Select Image $entity";
}
