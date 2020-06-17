import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/login_bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rules/rules.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginEmailChanged && event is! LoginPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is LoginEmailChanged || event is LoginPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield* _mapLoginEmailChangedToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedToState(event.password);
    } else if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    } else if (event is ResetPasswordWithEmail) {
      yield* _mapResetPasswordWithEmailToState(event.email);
    }
  }

  Stream<LoginState> _mapResetPasswordWithEmailToState(String email) async* {
    try {
      await _userRepository.resetPasswordWithEmail(email);
      yield LoginState.resetSuccess();
    } catch (_) {
      yield LoginState.resetFailure();
    }
  }

  Stream<LoginState> _mapLoginEmailChangedToState(String email) async* {
    final rule = Rule(
      email,
      name: "email",
      isRequired: true,
      isEmail: true,
    );

    yield state.update(
      isEmailValid: rule.hasError ? false : true,
    );
  }

  Stream<LoginState> _mapLoginPasswordChangedToState(String password) async* {
    final rule = Rule(
      password,
      name: "Password",
      isRequired: true,
      minLength: 8,
    );
    yield state.update(
      isPasswordValid: rule.hasError ? false : true,
    );
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      await _userRepository.getUser();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.userNotFound();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
