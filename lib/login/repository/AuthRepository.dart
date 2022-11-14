import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/login/repository/AuthRepositoryBase.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthRepository extends AuthRepositoryBase{
  final _firebaseAuth = FirebaseAuth.instance;

  //convertir un usuario de firebase a uno de auth user
  AuthUser ? _userFromFirebase (User? user) =>
      user == null ? null : AuthUser(user.uid, user.email,user.photoURL);
  @override
  // TODO: implement onAuthStateChanged
  Stream<AuthUser?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().asyncMap(_userFromFirebase);

  @override
  Future<AuthUser?> signInAnonymusly() async{
    // TODO: implement signInAnonymusly
    final user = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(user.user);
  }

  @override
  Future<void> signOut() async{
    // TODO: implement signout
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
  @override
  Future<AuthUser?>signInWithGoogle() async{
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final authResult =  await FirebaseAuth.instance.signInWithCredential(credential);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<AuthUser?> signInWithEmailAndPswd(String email, String pswd) async {
    // TODO: implement signInWithEmailAndPswd
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pswd);
    return _userFromFirebase(result.user);
  }

  @override
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String pswd) async {
    // TODO: implement signUp
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pswd);
    return _userFromFirebase(result.user);
  }
}