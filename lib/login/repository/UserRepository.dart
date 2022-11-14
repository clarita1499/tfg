import 'dart:io';

import 'package:untitled/login/model/User.dart';
import 'package:untitled/login/provider/firebase_provider.dart';
import 'package:untitled/login/repository/UserRepositoryBase.dart';

class UserRepository extends UserRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<myUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(myUser user, File? image)
  => provider.saveMyUser(user, image);
  
}