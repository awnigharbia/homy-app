import 'package:user_repository/src/entities/user_entity.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String userRole;
  final List<String> subscriptions;

  User({
    String id,
    this.username,
    this.email,
    this.userRole,
    this.subscriptions,
  }) : this.id = id;

  User copyWith(
      {String id,
      String username,
      String email,
      String userRole,
      List<String> subscriptions}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      userRole: userRole ?? this.userRole,
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }

  @override
  int get hashCode =>
      username.hashCode ^
      email.hashCode ^
      userRole.hashCode ^
      subscriptions.hashCode ^
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          email == other.email &&
          userRole == other.userRole &&
          subscriptions == other.subscriptions &&
          id == other.id;

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        username = data['username'],
        email = data['email'],
        userRole = data['userRole'],
        subscriptions = data['subscriptions'];

  @override
  String toString() =>
      'User username: $username, email: $email, userRole:$userRole, subscription:$subscriptions, ';

  UserEntity toEntity() {
    return UserEntity(id, username, email, userRole, subscriptions);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      userRole: entity.userRole,
      subscriptions: entity.subscriptions,
    );
  }
}
