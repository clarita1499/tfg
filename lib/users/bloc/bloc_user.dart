import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled/users/model/auth_firebase.dart';
import 'package:untitled/users/resources/auth_repository.dart';

class bloc_user implements Bloc{
  @override
  final _auth_repository = auth_repository();

  //flujo de datos-Firebase
   Stream <User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?>get authStatus => streamFirebase;

  //bloc se conecta con la interfaz de usuario
  //casos de uso de la aplicación de user
  //1.SigIn a la aplicación
  Future <UserCredential> signIn(){
    return _auth_repository.signInFirebase();
  }

  void dispose() {
    // TODO: implement dispose
  }

}
