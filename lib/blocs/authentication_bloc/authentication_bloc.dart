import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is NotComplete) {
      yield* _mapNotCompletedToState();
    } else if (event is ShopRegister) {
      yield* _mapShopRegisterToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    try {
      await _userRepository.getUser();

      if (_userRepository.currentUser.userRole == 'Customer') {
        yield Authenticated(_userRepository.currentUser);
      } else if (!_userRepository.isTraderHaveShop()) {
        yield TraderRegisterShop();
      } else {
        yield Authenticated(_userRepository.currentUser);
      }
    } catch (e) {
      // e.message;
    }
  }

  Stream<AuthenticationState> _mapShopRegisterToState() async* {
    yield TraderRegisterShop();
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }

  Stream<AuthenticationState> _mapNotCompletedToState() async* {
    final email = await _userRepository.getEmail();
    yield AuthenticatedNotComplete(email);
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (!isSignedIn) {
        yield Unauthenticated();
      }
      await _userRepository.getUser();
      // if (_userRepository.currentUser.userRole == 'Customer') {
      //   yield Authenticated(_userRepository.currentUser);
      // } else if (!_userRepository.isTraderHaveShop()) {
      //   yield TraderRegisterShop();
      // } else {
        yield Authenticated(_userRepository.currentUser);
      // }
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
