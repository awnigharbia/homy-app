import 'package:equatable/equatable.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {}

class NotComplete extends AuthenticationEvent {
  final String email;

  NotComplete({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => "email:$email not completetd.";
}

class ShopRegister extends AuthenticationEvent {
  final String userId;

  ShopRegister({this.userId});

  @override
  List<Object> get props => [userId];

  @override
  String toString() => "ShopRegister for { userId:$userId }";
}

class UpdateUser extends AuthenticationEvent {
  final User user;

  UpdateUser({this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => "Updated user: $user";
}

class UpdateEmail extends AuthenticationEvent {
  final User user;

  UpdateEmail({this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => "Updated user email: $user";
}

class UpdatePassword extends AuthenticationEvent {
  final String password;

  UpdatePassword({this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => "New password: $password";
}

class LoggedOut extends AuthenticationEvent {}
