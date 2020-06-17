import 'package:equatable/equatable.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:user_repository/src/user.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'Authenticated { userId: ${user.id}, username:${user.username}, email:${user.email}, userRole:${user.userRole} }';
}

class AuthenticatedNotComplete extends AuthenticationState {
  final String email;
  const AuthenticatedNotComplete(this.email);

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'Authentication not complete for email:$email';
}

class TraderRegisterShop extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}
