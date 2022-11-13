import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:untitled/users/bloc/user_event.dart';
import 'package:untitled/users/bloc/user_state.dart';

import '../model/user.dart';
import '../resources/auth_resources.dart';

class user_bloc extends Bloc<user_event,user_state> {
  user_bloc({required auth_resources authresources})
      : _authresources = authresources,
        super(authresources.currentUser.notEmpty
            ? user_state.authenticated(authresources.currentUser):
        const user_state.unauthenticated()
        ) {
    on<user_changed>(_on_user_changed);
    on<logout_requested>(_on_logout_requested);

    _userSubscription = _authresources.get_user.listen(
            (user) => add(user_changed(user)),
    );
  }

  final auth_resources _authresources;
  late final StreamSubscription<user> _userSubscription;

    void _on_user_changed(user_changed event, Emitter <user_state> emit) {
    emit(
        event.usuario.notEmpty
        ? user_state.authenticated(event.usuario)
        : const user_state.unauthenticated());
    }

    void _on_logout_requested(logout_requested event,
        Emitter <user_state> emit) {
    unawaited(_authresources.logout());
  }

  @override
  Future<void> close(){
    _userSubscription.cancel();
    return super.close();
  }
}

