import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/main.dart';

import '../repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = getIt();
  late StreamSubscription _authSubscription;

  AuthCubit() : super(AuthInitialState());

  Future<void> init() async {
    // Just for testing. Allows the splash screen to be shown a few seconds
    await Future.delayed(const Duration(seconds: 1));
    _authSubscription = _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  Future<void> reset() async => emit(AuthInitialState());

  void _authStateChanged(AuthUser? user) => user == null ? emit(AuthSignedOut()) : emit(AuthSignedIn(user));

  Future<void> createUserWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.createUserWithEmailAndPassword(email, password));

  Future<void> signInWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.signInWithEmailAndPassword(email, password));

  Future<void> signInAnonymously() => _signIn(_authRepository.signInAnonymously());

  Future<void> signInWithGoogle() => _signIn(_authRepository.signInWithGoogle());

  //fución general para iniciar sesión
  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthSigningIn());
      final user = await auxUser;
      if (user == null) {
        emit(AuthError("Unknown error, try again later"));
      } else {
        emit(AuthSignedIn(user));
      }
    } catch (e) {
      emit(AuthError("Error ${e.toString()}"));
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthSignedOut());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

//estado inicial
class AuthInitialState extends AuthState {}

//estado error en el inicio de sesión
class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

//estado no ha iniciado sesión
class AuthSignedOut extends AuthState {}

//estado iniciando sesión
class AuthSigningIn extends AuthState {}

//estado ya ha iniciado sesión
class AuthSignedIn extends AuthState {
  final AuthUser user;

  AuthSignedIn(this.user);

  @override
  List<Object?> get props => [user];
}