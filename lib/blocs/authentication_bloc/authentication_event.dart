import 'package:equatable/equatable.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';

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

class ShopRegister extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}
