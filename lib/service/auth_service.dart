import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/modelos/User.dart';
import 'package:untitled/service/user_service.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _google = GoogleSignIn();
  final _userService = UserService();

  Future<UserCredential> registerUserWithEmailAndPassword(
      String name, String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /*****************************************************************************
   *                              GET CURRENT ID                                *
   ******************************************************************************/
  String getCurrentId() {
    return _auth.currentUser!.uid;
  }

  loginAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        default:
          print("{Error : $e}");
      }
    }
  }


  loginWithEmailAndPassword(String email, String password) async {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
  }


  signInWithGoogle() async {
    try {
      final googleUser = await _google.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var signInResult =  await FirebaseAuth.instance.signInWithCredential(credential);

      if(signInResult.credential!=null && signInResult.user!=null){
        var id = signInResult.user!.uid;
        var username = signInResult.user!.displayName ?? 'N/A';
        var email = signInResult.user!.email ?? 'N/A';

        var firebaseUser = MyUser(username, '', email);
        await _userService.add(id, firebaseUser);
      }else{
        throw Exception('No se puede iniciar sesión intente más tarde');
      }
    } catch (ex) {
      print('error login with google: $ex');
      rethrow;
    }
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
