import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class auth_resources {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  auth_resources({firebase_auth.FirebaseAuth? firebaseAuth}) :
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  var currentUser = user.empty;

  Stream<user> get get_user {
    return _firebaseAuth.authStateChanges().map((User) {
      final usuario = User == null ? user.empty : User.toUser;
      currentUser = usuario;
      return usuario;
    });
  }

  Future <void> signup({
    required String email,
    required String pswd
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email,
          password: pswd);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future <void> login_with_email_and_password({
    required String email,
    required String pswd
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email,
          password: pswd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    } catch (e) {
      throw Exception(e);
    }
  }
}
/*
Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    throw Exception(e.toString());
  }
}

 */

extension on firebase_auth.User{
  user get toUser{
    return user(subname: uid, email: email, name: displayName, photo: photoURL);
  }
}