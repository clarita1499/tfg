import 'dart:io';

import '../../../main.dart';
import '../../model/User.dart';
import '../Firebase_data_source.dart';
import '../myUser_repository.dart';


class MyUserRepositoryImp extends MyUserRepository {
  final FirebaseDataSource _fDataSource = getIt();



  @override
  Stream<Iterable<MyUser>> getMyUsers() {
    return _fDataSource.getMyUsers();
  }

  @override
  Future<void> saveMyUser(MyUser myUser, File? image) {
    return _fDataSource.saveMyUser(myUser, image);
  }

  @override
  Future<void> deleteMyUser(MyUser myUser) {
    return _fDataSource.deleteMyUser(myUser);
  }

}