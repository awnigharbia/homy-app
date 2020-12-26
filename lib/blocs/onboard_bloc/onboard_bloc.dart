import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/onboard_bloc/bloc.dart';

enum MyEvent {
  OnBoardPage,
  LoginPage,
  RegisterPage,
}

class OnBoardBloc extends Bloc<MyEvent, MyState> {
  OnBoardBloc() : super(OnBoardPage());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.OnBoardPage:
        yield OnBoardPage();
        break;
      case MyEvent.LoginPage:
        yield LoginPage();
        break;
      case MyEvent.RegisterPage:
        yield RegisterPage();
        break;
    }
  }
}
