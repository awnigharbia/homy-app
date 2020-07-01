import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/shop_register_event.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/shop_register_state.dart';
import 'package:meta/meta.dart';
import 'package:rules/rules.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_repository/shop_repository.dart';

class ShopRegisterBloc extends Bloc<ShopRegisterEvent, ShopRegisterState> {
  final ShopRepository _shopRepository;

  ShopRegisterBloc({@required ShopRepository shopRepository})
      : assert(shopRepository != null),
        _shopRepository = shopRepository;

  @override
  ShopRegisterState get initialState => ShopRegisterState.empty();

  @override
  Stream<Transition<ShopRegisterEvent, ShopRegisterState>> transformEvents(
    Stream<ShopRegisterEvent> events,
    TransitionFunction<ShopRegisterEvent, ShopRegisterState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! ShopNameChanged &&
          event is! ShopPhoneChanged &&
          event is! ShopDescriptionChanged &&
          event is! ShopTypeChanged &&
          event is! ShopLocationChanged);
    });
    final debounceStream = events.where((event) {
      return (event is ShopNameChanged ||
          event is ShopPhoneChanged ||
          event is ShopDescriptionChanged ||
          event is ShopLocationChanged ||
          event is ShopTypeChanged);
    }).debounceTime(Duration(milliseconds: 600));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<ShopRegisterState> mapEventToState(
    ShopRegisterEvent event,
  ) async* {
    if (event is ShopNameChanged) {
      yield* _mapShopNameChangedToState(event.shopName);
    } else if (event is ShopDescriptionChanged) {
      yield* _mapShopDescriptionChangedToState(event.shopDescription);
    } else if (event is ShopTypeChanged) {
      yield* _mapShopTypeChangedtoState(event.shopType);
    } else if (event is ShopLocationChanged) {
      yield* _mapShopLocationChangedToState(event.shopLocation);
    } else if (event is ShopPhoneChanged) {
      yield* _mapShopPhoneChangedToState(event.shopPhone);
    } else if (event is Next) {
      yield* _mapNextToState();
    } else if (event is Back) {
      yield* _mapBackToState();
    } else if (event is UpdateShop) {
      yield* _mapUpdateShopToState(event.shop);
    } else if (event is SaveShop) {
      yield* _mapFormSaveShopToState(
        event.shopName,
        event.shopDescription,
        event.shopPhone,
        event.shopLocation,
        event.shopType,
        event.ownerId,
      );
    }
  }

  Stream<ShopRegisterState> _mapShopNameChangedToState(String shopName) async* {
    final rule = Rule(
      shopName,
      name: "Shop name",
      isRequired: true,
      maxLength: 32,
    );

    yield state.update(
      isShopNameValid: rule.hasError ? false : true,
    );
  }

  Stream<ShopRegisterState> _mapShopDescriptionChangedToState(
      String shopDescription) async* {
    final rule = Rule(
      shopDescription,
      name: "Shop description",
      isRequired: true,
      maxLength: 200,
    );

    yield state.update(
      isShopDescriptionValid: rule.hasError ? false : true,
    );
  }

  Stream<ShopRegisterState> _mapShopTypeChangedtoState(String shopType) async* {
    final rule = Rule(shopType, name: "Shop type", isRequired: true, inList: [
      'Shoes and Cloths',
      'Food and drink',
      'Fashion and style',
      'Electronic and mechanics'
    ]);

    yield state.update(
      isShopTypeValid: rule.hasError ? false : true,
    );
  }

  Stream<ShopRegisterState> _mapShopLocationChangedToState(
      String shopLocation) async* {
    final rule = Rule(
      shopLocation,
      name: "Shop location",
      isRequired: true,
      maxLength: 100,
    );

    yield state.update(
      isShopLocationValid: rule.hasError ? false : true,
    );
  }

  Stream<ShopRegisterState> _mapShopPhoneChangedToState(
      String shopPhone) async* {
    final rule = Rule(
      shopPhone,
      name: "Shop phone",
      isRequired: true,
      isNumeric: true,
      minLength: 10,
    );

    yield state.update(
      isShopPhoneValid: rule.hasError ? false : true,
    );
  }

  Stream<ShopRegisterState> _mapNextToState() async* {
    yield ShopRegisterState.next();
  }

  Stream<ShopRegisterState> _mapBackToState() async* {
    yield ShopRegisterState.empty();
  }

  Stream<ShopRegisterState> _mapUpdateShopToState(Shop shop) async* {
    try {
      await _shopRepository.updateShop(shop);
      yield ShopRegisterState.updateSuccess();
    } catch (_) {
      yield ShopRegisterState.failure();
    }
  }

  Stream<ShopRegisterState> _mapFormSaveShopToState(
    String shopName,
    String shopDescription,
    String shopPhone,
    String shopLocation,
    String shopType,
    String ownerId,
  ) async* {
    yield ShopRegisterState.loading();
    try {
      await _shopRepository.createNewShop(
        new Shop(
          shopName: shopName,
          shopDescription: shopDescription,
          shopPhone: shopPhone,
          shopLocation: shopLocation,
          shopType: shopType,
          ownerId: ownerId,
        ),
      );
      yield ShopRegisterState.success();
    } catch (_) {
      yield ShopRegisterState.failure();
    }
  }
}
