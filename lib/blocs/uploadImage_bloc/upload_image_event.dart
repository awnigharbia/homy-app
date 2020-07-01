part of 'upload_image_bloc.dart';

@immutable
abstract class UploadImageEvent extends Equatable {
  const UploadImageEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends UploadImageEvent {
  final Product product;

  UploadImage({this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'Upload image for { product:$product }';
}

class ClearUploadImage extends UploadImageEvent {}
