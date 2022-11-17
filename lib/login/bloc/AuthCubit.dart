import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/login/repository/AuthRepositoryBase.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;

  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async{
    await Future.delayed(Duration(seconds: 3));
    _authSubscription = _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }
  Future<void> reset() async => emit(AuthInitialState());

  //para emitir un estado
  void _authStateChanged (AuthUser? user) =>
      user == null ? emit(AuthtSignedOut()) : emit(AuthtSignedIn(user));

  Future<void> signInAnonymusly() =>
      _signIn(_authRepository.signInAnonymusly()
      );
  Future<void> signInWithGoogle() =>
      _signIn(_authRepository.signInWithGoogle()
      );
  Future<void> signInWithEmailAndPassword(String email, String pswd) =>
      _signIn(_authRepository.signInWithEmailAndPswd(email, pswd)
      );
  Future<void> createUserWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.createUserWithEmailAndPassword(email, password));

  Future <void> _signIn(Future<AuthUser?> auxUser) async{
    try{
      emit(AuthtSigningIn());
      final user = await auxUser;
      if(user == null) {
        emit(AuthError("Contraseña o email incorrecto, intentalo de nuevo"));
      }else{
        emit(AuthtSignedIn(user));
      }
    } catch (e){
      emit(AuthError("Error : ${e.toString()}"));
    }
  }

  Future <void> signOut() async{
    await _authRepository.signOut();
    emit(AuthtSignedOut());
}

  Future<void> close() async{
    _authSubscription.cancel();
    return super.close();
  }
}

abstract class AuthState extends Equatable{
  List<Object> get props => [];
}
//iniciar sesión con error
class AuthError extends AuthState{
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}

//iniciar sesión
class AuthInitialState extends AuthState{}
//no ha iniciado sesión
class AuthtSignedOut extends AuthState{}
//está iniciando sesión
class AuthtSigningIn extends AuthState{}
//ya ha iniciado sesión
class AuthtSignedIn extends AuthState{
  final AuthUser user;

  AuthtSignedIn(this.user);

  @override
  List<Object> get props => [user];
}