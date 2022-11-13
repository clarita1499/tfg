import 'package:equatable/equatable.dart';

class user extends Equatable{
  final String subname;
  final String? email;
  final String? name;
  final String? photo;

  const user({required this.subname, this.email, this.name, this.photo});

  static const empty = user(subname: '');

  bool get isEmpty => this == user.empty;
  bool get notEmpty => this != user.empty;

  @override
  // TODO: implement props
  List<Object?> get props => [subname,email,name,photo];
}