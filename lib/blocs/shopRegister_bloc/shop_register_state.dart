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
  });

  factory ShopRegisterState.empty() {
    return ShopRegisterState(
      isShopNameValid: true,
      isShopPhoneValid: true,
      isShopLocationValid: true,
      isShopDescriptionValid: true,
      isShopTypeValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isNext: false,
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
    );
  }

  ShopRegisterState update(
      {bool isShopNameValid,
      bool isShopPhoneValid,
      bool isShopLocationValid,
      bool isUserRoleValid,
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

  ShopRegisterState copyWith({
    bool isShopNameValid,
    bool isShopPhoneValid,
    bool isShopLocationValid,
    bool isShopDescriptionValid,
    bool isShopTypeValid,
    bool isSuccess,
    bool isFailure,
    bool isNext,
    bool isSubmitting,
  }) {
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
      isNext: $isNext
    }''';
  }
}
