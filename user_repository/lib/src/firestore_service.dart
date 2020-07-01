import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/src/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      await _usersCollectionReference
          .document(user.id)
          .setData(user.toEntity().toDocument());
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


  Future updateUser(User updatedUser) async {
    return _usersCollectionReference
        .document(updatedUser.id)
        .updateData(updatedUser.toEntity().toDocument());
  }
}
