import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/src/firestore_service.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirestoreService _firestoreService = FirestoreService();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  UserRepository(
      {FirebaseAuth firebaseAuth,
      GoogleSignIn googleSignin,
      FacebookAuth facebookAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return _firebaseAuth.currentUser;
    } catch (e) {
      throw new Error();
    }
  }

  Future<User> signInWithFacebook() async {
    String _token;

    await _facebookAuth.login();
    final userData = await FacebookAuth.instance.getUserData();
    print(userData);
    AuthCredential credential = FacebookAuthProvider.credential(_token);
    final User user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    print(user);

    return null;
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future updateUserEmail(UserModel updatedUser) async {
    try {
      final User user = _firebaseAuth.currentUser;
      user.updateEmail(updatedUser.email);

      _firestoreService.updateUser(updatedUser);
    } catch (e) {
      throw new Error();
    }
  }

  Future updateUserPassword(String password) async {
    try {
      final User user = _firebaseAuth.currentUser;
      user.updatePassword(password);
    } catch (e) {
      print('Update password faild');
    }
  }

  Future updateUserData(UserModel user) async {
    _firestoreService.updateUser(user);
  }

  void deleteAccount() {
    final User user = _firebaseAuth.currentUser;
    user.delete();
  }

  Future saveUser({
    @required String email,
    @required String username,
    @required String userRole,
  }) async {
    try {
      var authResult = _firebaseAuth.currentUser;

      _currentUser = UserModel(
        id: authResult.uid,
        email: email,
        username: username,
        userRole: userRole,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUp({
    @required String email,
    @required String password,
    @required String username,
    @required String userRole,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUser = UserModel(
        id: authResult.user.uid,
        email: email,
        username: username,
        userRole: userRole,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
      FacebookAuth.instance.logOut(),
    ]);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> getEmail() async {
    final user = _firebaseAuth.currentUser;

    return user.email;
  }

  Future<User> getUser() async {
    var user = _firebaseAuth.currentUser;
    return _currentUser = await _firestoreService.getUser(user.uid);
  }
}
