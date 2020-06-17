import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

abstract class RegisterShopEvent extends Equatable {
  const RegisterShopEvent();

  @override
  List<Object> get props => [];
}

class Next extends RegisterShopEvent {}

class ShopNameChanged extends RegisterShopEvent {
  final String shopName;

  ShopNameChanged({@required this.shopName});

  @override
  List<Object> get props => [shopName];

  @override
  String toString() => 'ShopNameChanged to:{shopName: $shopName}';
}

class ShopPhoneChanged extends RegisterShopEvent {
  final String shopPhone;

  ShopPhoneChanged({@required this.shopPhone});

  @override
  List<Object> get props => [shopPhone];

  @override
  String toString() => 'shopPhoneChanged to:{shopPhone: $shopPhone}';
}

class ShopDescriptionChanged extends RegisterShopEvent {
  final String shopDescription;

  ShopDescriptionChanged({@required this.shopDescription});

  @override
  List<Object> get props => [shopDescription];

  @override
  String toString() =>
      'shopDescriptionChanged to:{shopDescription: $shopDescription}';
}

class ShopLocationChanged extends RegisterShopEvent {
  final String shopLocation;

  ShopLocationChanged({@required this.shopLocation});

  @override
  List<Object> get props => [shopLocation];

  @override
  String toString() => 'shopLocationChanged to:{shopLocation: $shopLocation}';
}

class ShopTypeChanged extends RegisterShopEvent {
  final String shopType;

  ShopTypeChanged({@required this.shopType});

  @override
  List<Object> get props => [shopType];

  @override
  String toString() => 'shopTypeChanged to:{shopType: $shopType}';
}

class Submitted extends RegisterShopEvent {
  final String shopName;
  final String shopLocation;
  final String shopPhone;
  final String shopDescripton;
  final String shopType;

  const Submitted({
    @required this.shopName,
    @required this.shopLocation,
    @required this.shopPhone,
    @required this.shopDescripton,
    @required this.shopType,
  });

  @override
  List<Object> get props =>
      [shopName, shopLocation, shopPhone, shopDescripton, shopType];

  @override
  String toString() {
    return 'Submitted { shopName: $shopName, shopDescripton: $shopDescripton, shopLocation: $shopLocation, shopPhone: $shopPhone, shopType: $shopType }';
  }
}
