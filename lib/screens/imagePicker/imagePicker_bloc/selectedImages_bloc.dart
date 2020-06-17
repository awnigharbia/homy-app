import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/screens/imagePicker/imagePicker_bloc/selectedImages_events.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectedImagesBloc extends Bloc<SelectedImagesEvent, List<AssetEntity>> {
  @override
  List<AssetEntity> get initialState => [];

  @override
  Stream<List<AssetEntity>> mapEventToState(SelectedImagesEvent event) async* {
    if (event is SelectImage) {
      if (state.contains(event.entity)) {
        state.remove(event.entity);
      } else {
        state.add(event.entity);
      }
      print(state);
      yield List.from(state);
    }
    if (event is ClearSelected) {
      yield [];
    }
  }
}
