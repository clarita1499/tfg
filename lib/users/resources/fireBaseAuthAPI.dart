//toda la lógica de la conexión con firebase auth

import 'package:firebase_auth/firebase_auth.dart';
import'package:google_sign_in/google_sign_in.dart';

class fireBaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  //final UserCredential userCredential = signInWithEmailAndPassword(username,password);

  Future<UserCredential> signIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
/*
  Future<UserCredential> signInWithEmailAndPassword(
      final String username,
      final String password,
      ) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password
    );

 */

}





