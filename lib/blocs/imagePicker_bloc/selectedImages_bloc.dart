import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/imagePicker_bloc/selectedImages_events.dart';
import 'package:flutter_firestore_todos/blocs/imagePicker_bloc/selectedImages_state.dart';

class SelectedImagesBloc
    extends Bloc<SelectedImagesEvent, SelectedImagesState> {
  SelectedImagesBloc() : super(InitialSelectedImages());

  @override
  Stream<SelectedImagesState> mapEventToState(
      SelectedImagesEvent event) async* {
    if (event is SelectImage) {
      yield SelectedImages(event.entity);
    }
    if (event is ClearSelected) {
      yield InitialSelectedImages();
    }
  }
}
