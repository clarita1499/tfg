import 'package:equatable/equatable.dart';

import '../model/user.dart';

abstract class user_event extends Equatable{
  const user_event();

  List<Object> get props => [];
}
class logout_requested extends user_event{}

class user_changed extends user_event{
  final user usuario;

  const user_changed (this.usuario);

  List<Object> get props => [user];

}
