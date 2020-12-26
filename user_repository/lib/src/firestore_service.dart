import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/src/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference
          .doc(user.id)
          .set(user.toEntity().toDocument());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String id) async {
    try {
      var userData = await _usersCollectionReference.doc(id).get();
      return UserModel.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Future updateUser(UserModel updatedUser) async {
    return _usersCollectionReference
        .doc(updatedUser.id)
        .update(updatedUser.toEntity().toDocument());
  }
}
