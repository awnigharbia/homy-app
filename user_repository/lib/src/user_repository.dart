import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/src/firestore_service.dart';
import 'package:user_repository/src/user.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirestoreService _firestoreService = FirestoreService();

  User _currentUser;
  User get currentUser => _currentUser;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return _firebaseAuth.currentUser();
    } catch (e) {
      throw new Error();
    }
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future saveUser({
    @required String email,
    @required String username,
    @required String userRole,
  }) async {
    try {
      var authResult = await _firebaseAuth.currentUser();

      _currentUser = User(
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

      _currentUser = User(
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
    ]);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getEmail() async {
    final email = await _firebaseAuth.currentUser();

    return email.email;
  }

  Future<void> getUser() async {
    var user = await _firebaseAuth.currentUser();
    _currentUser = await _firestoreService.getUser(user.uid);
  }

  bool isTraderHaveShop() {
    return _currentUser.userRole == 'Trader' && _currentUser.shopId != null
        ? _currentUser.shopId.isNotEmpty
        : false;
  }
}
