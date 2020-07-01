import 'package:meta/meta.dart';

@immutable
class ShopRegisterState {
  final bool isShopNameValid;
  final bool isShopPhoneValid;
  final bool isShopLocationValid;
  final bool isShopDescriptionValid;
  final bool isShopTypeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isNext;
  final bool isFailure;
  final bool isUpdateSuccess;

  bool get isFormValid =>
      isShopNameValid &&
      isShopPhoneValid &&
      isShopLocationValid &&
      isShopDescriptionValid;

  ShopRegisterState({
    @required this.isShopNameValid,
    @required this.isShopPhoneValid,
    @required this.isShopTypeValid,
    @required this.isShopLocationValid,
    @required this.isShopDescriptionValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isNext,
    @required this.isUpdateSuccess,
  });

  factory ShopRegisterState.empty() {
    return ShopRegisterState(
      isShopNameValid: false,
      isShopPhoneValid: false,
      isShopLocationValid: false,
      isShopDescriptionValid: false,
      isShopTypeValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isNext: false,
      isUpdateSuccess: false,
    );
  }

  factory ShopRegisterState.loading() {
    return ShopRegisterState(
      isShopNameValid: true,
      isShopPhoneValid: true,
      isShopLocationValid: true,
      isShopDescriptionValid: true,
      isShopTypeValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isNext: false,
      isUpdateSuccess: false,
    );
  }

  factory ShopRegisterState.failure() {
    return ShopRegisterState(
      isShopNameValid: true,
      isShopPhoneValid: true,
      isShopLocationValid: true,
      isShopDescriptionValid: true,
      isShopTypeValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isNext: false,
      isUpdateSuccess: false,
    );
  }

  factory ShopRegisterState.next() {
    return ShopRegisterState(
      isShopNameValid: true,
      isShopPhoneValid: true,
      isShopLocationValid: true,
      isShopDescriptionValid: true,
      isShopTypeValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isNext: true,
      isUpdateSuccess: false,
    );
  }

  factory ShopRegisterState.success() {
    return ShopRegisterState(
      isShopNameValid: true,
      isShopPhoneValid: true,
      isShopLocationValid: true,
      isShopDescriptionValid: true,
      isShopTypeValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isNext: false,
      isUpdateSuccess: false,
    );
  }

  factory ShopRegisterState.updateSuccess() {
    return ShopRegisterState(
      isShopNameValid: true,
      isShopPhoneValid: true,
      isShopLocationValid: true,
      isShopDescriptionValid: true,
      isShopTypeValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isNext: false,
      isUpdateSuccess: true,
    );
  }

  ShopRegisterState update(
      {bool isShopNameValid,
      bool isShopPhoneValid,
      bool isShopLocationValid,
      bool isShopDescriptionValid,
      bool isShopTypeValid}) {
    return copyWith(
      isShopNameValid: isShopNameValid,
      isShopPhoneValid: isShopPhoneValid,
      isShopLocationValid: isShopLocationValid,
      isShopDescriptionValid: isShopDescriptionValid,
      isShopTypeValid: isShopTypeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isNext: false,
    );
  }

  ShopRegisterState copyWith(
      {bool isShopNameValid,
      bool isShopPhoneValid,
      bool isShopLocationValid,
      bool isShopDescriptionValid,
      bool isShopTypeValid,
      bool isSuccess,
      bool isFailure,
      bool isNext,
      bool isSubmitting,
      bool isUpdateSuccess}) {
    return ShopRegisterState(
      isShopNameValid: isShopNameValid ?? this.isShopNameValid,
      isShopPhoneValid: isShopPhoneValid ?? this.isShopPhoneValid,
      isShopLocationValid: isShopLocationValid ?? this.isShopLocationValid,
      isShopDescriptionValid:
          isShopDescriptionValid ?? this.isShopDescriptionValid,
      isShopTypeValid: isShopTypeValid ?? this.isShopTypeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isNext: isNext ?? this.isNext,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
    );
  }

  @override
  String toString() {
    return '''ShopRegisterState {
      isShopNameValid:$isShopNameValid,
      isShopPhoneValid: $isShopPhoneValid,
      isShopLocationValid: $isShopLocationValid,
      isShopDescriptionValid: $isShopDescriptionValid,
      isShopTypeValid:$isShopTypeValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isNext: $isNext,
      isUpdateSuccess: $isUpdateSuccess,
    }''';
  }
}
