import 'package:untitled/users/model/user.dart';
import 'package:equatable/equatable.dart';


enum user_status {authenticated, unathenticated}

class user_state extends Equatable{
  final user_status status;
  final user usuario;

  const user_state._({required this.status,
  this.usuario = user.empty});

  const user_state.authenticated(user usuario):
        this._(status: user_status.authenticated,
          usuario: usuario,);

  const user_state.unauthenticated() : this._(status:  user_status.unathenticated);

  @override
  List<Object?> get props => [status,usuario];

}