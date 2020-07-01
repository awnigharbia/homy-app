import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/create_shop_bloc/bloc.dart';

enum MyEvent {
  ShopRegisterPage,
  ShopTypePage,
}

class CreateShopBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => ShopRegisterInfo();

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.ShopRegisterPage:
        yield ShopRegisterInfo();
        break;
      case MyEvent.ShopTypePage:
        yield ShopTypeChoose();
        break;
    }
  }
}
