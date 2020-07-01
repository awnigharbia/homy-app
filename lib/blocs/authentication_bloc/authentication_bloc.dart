import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  final FirebaseShopRepository _shopRepository;

  AuthenticationBloc(
      {@required UserRepository userRepository,
      @required FirebaseShopRepository shopRepository})
      : assert(userRepository != null, shopRepository != null),
        _userRepository = userRepository,
        _shopRepository = shopRepository;

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
      yield* _mapShopRegisterToState(event.userId);
    } else if (event is UpdateUser) {
      yield* _mapUpdateUserToState(event.user);
    } else if (event is UpdateEmail) {
      yield* _mapUpdateEmailToState(event.user);
    } else if (event is UpdatePassword) {
      yield* _mapUpdatePasswordToState(event.password);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    try {
      await _userRepository.getUser();
      final isHaveShop =
          await _shopRepository.isShopOwner(_userRepository.currentUser.id);

      if (_userRepository.currentUser.userRole == 'Customer') {
        final shopInfo =
            await _shopRepository.getShopInfo(_userRepository.currentUser.id);
        yield Authenticated(_userRepository.currentUser, shopInfo[0]);
      } else if (!isHaveShop) {
        yield TraderRegisterShop(_userRepository.currentUser.id);
      } else {
        final shopInfo =
            await _shopRepository.getShopInfo(_userRepository.currentUser.id);
        yield Authenticated(_userRepository.currentUser, shopInfo[0]);
      }
    } catch (e) {
      // e.message;
    }
  }

  Stream<AuthenticationState> _mapUpdateUserToState(User user) async* {
    await _userRepository.updateUserData(user);
  }

  Stream<AuthenticationState> _mapUpdatePasswordToState(
      String password) async* {
    await _userRepository.updateUserPassword(password);
  }

  Stream<AuthenticationState> _mapUpdateEmailToState(User user) async* {
    await _userRepository.updateUserEmail(user);
  }

  Stream<AuthenticationState> _mapShopRegisterToState(String userId) async* {
    yield TraderRegisterShop(userId);
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
      await _userRepository.getUser();

      final isSignedIn = await _userRepository.isSignedIn();
      final isHaveShop =
          await _shopRepository.isShopOwner(_userRepository.currentUser.id);

      if (!isSignedIn) {
        yield Unauthenticated();
      }

      if (_userRepository.currentUser.userRole == 'Customer') {
        final shopInfo =
            await _shopRepository.getShopInfo(_userRepository.currentUser.id);
        yield Authenticated(_userRepository.currentUser, shopInfo[0]);
      } else if (!isHaveShop) {
        yield TraderRegisterShop(_userRepository.currentUser.id);
      } else {
        final shopInfo =
            await _shopRepository.getShopInfo(_userRepository.currentUser.id);
        yield Authenticated(_userRepository.currentUser, shopInfo[0]);
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
