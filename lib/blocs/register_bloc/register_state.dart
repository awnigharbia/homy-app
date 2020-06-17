import 'package:meta/meta.dart';

@immutable
class RegisterState {
  final bool isUsernameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isUserRoleValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isNotCompleted;
  final bool isFailure;

  bool get isFormValid =>
      isEmailValid && isPasswordValid && isUserRoleValid && isUsernameValid;

  RegisterState(
      {@required this.isEmailValid,
      @required this.isUsernameValid,
      @required this.isPasswordValid,
      @required this.isUserRoleValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.isNotCompleted});

  factory RegisterState.empty() {
    return RegisterState(
      isUsernameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isUserRoleValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isNotCompleted: false,
    );
  }

  factory RegisterState.loading() {
    return RegisterState(
      isUsernameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isUserRoleValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isNotCompleted: false,
    );
  }

  factory RegisterState.failure() {
    return RegisterState(
      isUsernameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isUserRoleValid: true,
      isSubmitting: false,
      isSuccess: false,
      isNotCompleted: true,
      isFailure: true,
    );
  }

  factory RegisterState.notComplete() {
    return RegisterState(
      isUsernameValid: false,
      isEmailValid: true,
      isPasswordValid: true,
      isUserRoleValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isNotCompleted: true,
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      isUsernameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isUserRoleValid: true,
      isSubmitting: false,
      isSuccess: true,
      isNotCompleted: false,
      isFailure: false,
    );
  }

  RegisterState update(
      {bool isUsernameValid,
      bool isEmailValid,
      bool isPasswordValid,
      bool isUserRoleValid,
      bool isNotCompleted}) {
    return copyWith(
      isUsernameValid: isUsernameValid,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isUserRoleValid: isUserRoleValid,
      isNotCompleted: isNotCompleted,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isUserRoleValid,
    bool isSuccess,
    bool isFailure,
    bool isUsernameValid,
    bool isNotCompleted,
  }) {
    return RegisterState(
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isUserRoleValid: isUserRoleValid ?? this.isUserRoleValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isNotCompleted: isNotCompleted ?? this.isNotCompleted,
    );
  }

  @override
  String toString() {
    return '''RegisterState {
      isUsernameValid:$isUsernameValid,
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isUserRoleValid: $isUserRoleValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isNotCompleted: $isNotCompleted
    }''';
  }
}
