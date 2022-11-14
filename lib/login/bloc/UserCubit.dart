import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/User.dart';
import '../repository/UserRepositoryBase.dart';

class UserCubit extends Cubit<UserState> {

  final UserRepositoryBase _userRepository;
  File ? _pickedImage;
  late myUser _user;

  UserCubit(this._userRepository) : super(UserLoadingState());

  void setImage(File? imageFile) async {
    _pickedImage = imageFile;
    emit(UserReadyState(_user!, _pickedImage));
  }

  //para obtener el usuario
  Future<void> getMyUser() async {
    emit(UserLoadingState());
    _user = (await _userRepository.getMyUser()) ?? myUser('', '', '', 0);
    emit(UserReadyState(_user, _pickedImage));
  }

  Future<void> saveMyUser(
      String uid,
      String name,
      String lastName,
      int age
      ) async {
    _user = myUser(uid, name, lastName, age, image: _user.image);
    emit(UserReadyState(_user, _pickedImage, isSaving: true));

    await Future.delayed(Duration(seconds: 3));
    await _userRepository.saveMyUser(_user, _pickedImage);
    emit(UserReadyState(_user, _pickedImage));

  }
}
  abstract class UserState extends Equatable{
  @override
  List<Object?>get props => [];
  }

//cuando se está cargando el perfil
  class UserLoadingState extends UserState{}
  class UserReadyState extends UserState{
  final myUser user;
  final File? pickedImage;
  final isSaving;

  UserReadyState(this.user, this.pickedImage, {this.isSaving = false});

  @override
  List<Object?> get props => [user,pickedImage?.path, isSaving];
  }

//estado de cuando se hace petición a firebase para que guarde información
