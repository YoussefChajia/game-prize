import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  /// stream of the state of the authentication of the user
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  User? get currentUser => _firebaseAuth.currentUser;
  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      //! the user didn't sign in
      return;
    } else {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      OAuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credentials);
    }
  }

  Future<bool> signInWithEmailAndPassword(
      {@required String? email, @required String? password}) async {
    try {
      if (email == null || password == null) {
        print("the email or password are null ");
        return Future.value(false);
      }
      if (email.isEmpty || password.isEmpty) {
        print("email pr password are empty ");
        return Future.value(false);
      }
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print("Problem in sign in with email and password ${e.message}");
      return Future.value();
    }
  }

  Future<bool> signUpWithEmailAndPassword(
      {@required String? email, @required String? password}) async {
    try {
      if (email == null || password == null) {
        print("the email or password are null ");
        return Future.value(false);
      }
      if (email.isEmpty || password.isEmpty) {
        print("email pr password are empty ");
        return Future.value(false);
      }
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print("Problem in sign un with email and password ${e.message}");
      return Future.value();
    }
  }

  Future<bool> signInAnonymously() async {
    try {
      await _firebaseAuth.signInAnonymously();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    await _firebaseAuth.signOut();
  }
}
