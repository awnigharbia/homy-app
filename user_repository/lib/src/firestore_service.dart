import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/src/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String id) async {
    try {
      var userData = await _usersCollectionReference.document(id).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }
}
