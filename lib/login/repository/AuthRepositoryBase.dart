
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser extends Equatable{
  final String uid;
  final String? email;
  final String? photo;

  AuthUser(this.uid,{this.email,this.photo});

  List<Object> get props => [uid];
}

abstract class AuthRepositoryBase{

  Stream<AuthUser?> get onAuthStateChanged;

  //este login va a ser llamado por la capa de logica de negocio CUBIT y devuelve un usuario propio
  Future<AuthUser?>signInAnonymusly();
  Future<void>signOut();
  Future<AuthUser?>signInWithGoogle();
  Future<AuthUser?>createUserWithEmailAndPassword(String email, String pswd);
  Future<AuthUser?>signInWithEmailAndPswd(String email, String pswd);
}
