import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String email;
  final String userRole;
  final List<String> subscriptions;

  UserEntity(
    this.id,
    this.username,
    this.email,
    this.userRole,
    this.subscriptions,
  );

  @override
  List<Object> get props => [id, username, email, userRole, subscriptions];

  Map<String, Object> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "userRole": userRole,
      "subscriptions": subscriptions,
    };
  }

  Map<String, Object> toDocument() {
    return {
      "id":id,
      "username": username,
      "email": email,
      "userRole": userRole,
      "subscriptions": subscriptions,
    };
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
      snap.documentID,
      snap.data['username'],
      snap.data['email'],
      snap.data['userRole'],
      snap.data['subscriptions'],
    );
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json['id'] as String,
      json['username'] as String,
      json['email'] as String,
      json['userRole'] as String,
      json['subscriptions'] as List<String>,
    );
  }
}
