import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rules/rules.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_firestore_todos/blocs/register_bloc/register.dart';
import 'package:user_repository/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
    Stream<RegisterEvent> events,
    TransitionFunction<RegisterEvent, RegisterState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged &&
          event is! PasswordChanged &&
          event is! UsernameChanged &&
          event is! UserRoleChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged ||
          event is PasswordChanged ||
          event is UsernameChanged ||
          event is UserRoleChanged);
    }).debounceTime(Duration(milliseconds: 600));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is UsernameChanged) {
      yield* _mapUsernameChangedToState(event.username);
    } else if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is UserRoleChanged) {
      yield* _mapUserRoleChangedToState(event.userRole);
    } else if (event is CompleteRegistration) {
      yield* _mapCompleteRegisterationToState(
        event.username,
        event.email,
        event.userRole,
      );
    } else if (event is RegisterWithGoogle) {
      yield* _mapRegisterWithGoogleToState();
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(
          event.email, event.password, event.username, event.userRole);
    }
  }

  Stream<RegisterState> _mapCompleteRegisterationToState(
      String username, String email, String userRole) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.saveUser(
        email: email,
        username: username,
        userRole: userRole,
      );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }

  Stream<RegisterState> _mapRegisterWithGoogleToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      yield RegisterState.notComplete();
    } catch (_) {
      yield RegisterState.failure();
    }
  }

  Stream<RegisterState> _mapUserRoleChangedToState(String userRole) async* {
    final rule = Rule(
      userRole,
      name: "account type",
      inList: ['Customer', 'Trader'],
    );

    yield state.update(isUserRoleValid: rule.hasError ? false : true);
  }

  Stream<RegisterState> _mapUsernameChangedToState(String username) async* {
    final rule = Rule(username,
        name: "username", minLength: 5, isRequired: true, isAlphaSpace: false);

    yield state.update(
      isUsernameValid: rule.hasError ? false : true,
    );
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
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

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    final rule = Rule(
      password,
      name: "password",
      isRequired: true,
      minLength: 8,
    );

    yield state.update(
      isPasswordValid: rule.hasError ? false : true,
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String email,
    String password,
    String username,
    String userRole,
  ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(
        email: email,
        password: password,
        username: username,
        userRole: userRole,
      );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
