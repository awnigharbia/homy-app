import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop_repository/shop_repository.dart';

abstract class ShopRegisterEvent extends Equatable {
  const ShopRegisterEvent();

  @override
  List<Object> get props => [];
}

class Next extends ShopRegisterEvent {}

class Back extends ShopRegisterEvent {}

class ShopNameChanged extends ShopRegisterEvent {
  final String shopName;

  ShopNameChanged({@required this.shopName});

  @override
  List<Object> get props => [shopName];

  @override
  String toString() => 'ShopNameChanged to:{shopName: $shopName}';
}

class ShopPhoneChanged extends ShopRegisterEvent {
  final String shopPhone;

  ShopPhoneChanged({@required this.shopPhone});

  @override
  List<Object> get props => [shopPhone];

  @override
  String toString() => 'shopPhoneChanged to:{shopPhone: $shopPhone}';
}

class ShopDescriptionChanged extends ShopRegisterEvent {
  final String shopDescription;

  ShopDescriptionChanged({@required this.shopDescription});

  @override
  List<Object> get props => [shopDescription];

  @override
  String toString() =>
      'shopDescriptionChanged to:{shopDescription: $shopDescription}';
}

class ShopLocationChanged extends ShopRegisterEvent {
  final String shopLocation;

  ShopLocationChanged({@required this.shopLocation});

  @override
  List<Object> get props => [shopLocation];

  @override
  String toString() => 'shopLocationChanged to:{shopLocation: $shopLocation}';
}

class ShopTypeChanged extends ShopRegisterEvent {
  final String shopType;

  ShopTypeChanged({@required this.shopType});

  @override
  List<Object> get props => [shopType];

  @override
  String toString() => 'shopTypeChanged to:{shopType: $shopType}';
}

class UpdateShop extends ShopRegisterEvent {
  final Shop shop;

  UpdateShop({this.shop});

  @override
  List<Object> get props => [shop];

  @override
  String toString() => 'Updated shop:$shop';
}

class SaveShop extends ShopRegisterEvent {
  final String shopName;
  final String shopDescription;
  final String shopPhone;
  final String shopLocation;
  final String shopType;
  final String ownerId;

  SaveShop({
    @required this.shopName,
    @required this.shopDescription,
    @required this.shopPhone,
    @required this.shopLocation,
    @required this.shopType,
    @required this.ownerId,
  });

  @override
  List<Object> get props =>
      [shopName, shopDescription, shopPhone, shopLocation, shopType, ownerId];

  @override
  String toString() {
    return 'Submitted { shopName: $shopName, shopDescripton: $shopDescription, shopLocation: $shopLocation, shopPhone: $shopPhone, shopType: $shopType, ownerId:$ownerId }';
  }
}
