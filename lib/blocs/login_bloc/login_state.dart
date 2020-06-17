import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool isResetSuccess;
  final bool isResetFailure;
  final bool isUserNotFound;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isResetFailure,
    @required this.isResetSuccess,
    @required this.isUserNotFound,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isResetFailure: false,
      isResetSuccess: false,
      isUserNotFound: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isResetFailure: false,
      isResetSuccess: false,
      isUserNotFound: false,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isResetFailure: false,
      isResetSuccess: false,
      isUserNotFound: false,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isResetFailure: false,
      isResetSuccess: false,
      isUserNotFound: false,
    );
  }

  factory LoginState.resetSuccess() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: false,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      isResetFailure: false,
      isResetSuccess: true,
      isUserNotFound: false,
    );
  }

  factory LoginState.resetFailure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: false,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      isResetFailure: true,
      isResetSuccess: false,
      isUserNotFound: false,
    );
  }

  factory LoginState.userNotFound() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: false,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      isResetFailure: true,
      isResetSuccess: false,
      isUserNotFound: true,
    );
  }

  LoginState update({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isResetFailure: false,
      isResetSuccess: false,
      isFailure: false,
      isUserFound: false,
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    bool isResetSuccess,
    bool isResetFailure,
    bool isUserFound,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isResetSuccess: isResetSuccess ?? this.isResetSuccess,
      isResetFailure: isResetFailure ?? this.isResetFailure,
      isUserNotFound: isUserFound ?? this.isUserNotFound,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isResetSuccess: $isResetSuccess, 
      isResetFailure: $isResetFailure,
      isUserFound: $isUserNotFound
    }''';
  }
}
