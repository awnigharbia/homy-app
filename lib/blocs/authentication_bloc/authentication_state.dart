import 'package:equatable/equatable.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:user_repository/user_repository.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;
  final Shop shop;

  const Authenticated(this.user, this.shop);

  @override
  List<Object> get props => [user, shop];

  @override
  String toString() =>
      'Authenticated { userId: ${user.id}, username:${user.username}, email:${user.email}, userRole:${user.userRole}, currentShopInfo:$shop }';
}

class AuthenticatedNotComplete extends AuthenticationState {
  final String email;
  const AuthenticatedNotComplete(this.email);

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'Authentication not complete for email:$email';
}

class TraderRegisterShop extends AuthenticationState {
  final String userId;

  TraderRegisterShop(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'RegisterShop for userId:$userId';
}

class Unauthenticated extends AuthenticationState {}
