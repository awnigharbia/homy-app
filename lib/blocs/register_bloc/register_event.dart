import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends RegisterEvent {
  final String username;

  const UsernameChanged({@required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() => "UsernameChanged { username :$username }";
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class UserRoleChanged extends RegisterEvent {
  final String userRole;

  const UserRoleChanged({@required this.userRole});

  @override
  List<Object> get props => [userRole];

  @override
  String toString() => 'UserRoleChanged { userRole: $userRole }';
}

class RegisterNotComplete extends RegisterEvent {}

class CompleteRegistration extends RegisterEvent {
  final String username;
  final String userRole;
  final String email;

  CompleteRegistration(
      {@required this.email, @required this.username, @required this.userRole});

  @override
  List<Object> get props => [email, username, userRole];

  @override
  String toString() =>
      'CompleteRegistration email:$email, username:$username, userRole:$userRole';
}

class RegisterWithGoogle extends RegisterEvent {}

class Submitted extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String userRole;

  const Submitted({
    @required this.username,
    @required this.email,
    @required this.password,
    @required this.userRole,
  });

  @override
  List<Object> get props => [username, email, password, userRole];

  @override
  String toString() {
    return 'Submitted { username: $username, email: $email, password: $password, userRole: $userRole }';
  }
}
