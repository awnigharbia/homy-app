class User {
  final String id;
  final String username;
  final String email;
  final String userRole;
  final List<String> subscriptions;
  final String shopId;

  User({
    this.id,
    this.username,
    this.email,
    this.userRole,
    this.subscriptions,
    this.shopId,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        username = data['username'],
        email = data['email'],
        userRole = data['userRole'],
        subscriptions = data['subscriptions'],
        shopId = data['shopId'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'userRole': userRole,
      'subscriptions': subscriptions,
      'shopId': shopId
    };
  }
}
