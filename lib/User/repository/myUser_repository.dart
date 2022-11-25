import 'dart:io';

import 'package:untitled/User/model/User.dart';

abstract class MyUserRepository {
  //String newId();

  Stream<Iterable<MyUser>> getMyUsers();

  Future<void> saveMyUser(MyUser myUser, File? image);

  Future<void> deleteMyUser(MyUser myUser);
}