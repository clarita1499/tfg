import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/users/resources/fireBaseAuthAPI.dart';


class auth_repository{

  final _firebaseAuthAPI = fireBaseAuthAPI();

  Future<UserCredential> signInFirebase() => _firebaseAuthAPI.signIn();


  /*const auth_repository();

  Future<UserCredential> signInWithEmail(
      final String username,
      final String password
      );

   */

}