
import 'dart:io';

import '../model/User.dart';

abstract class UserRepositoryBase {
  Future<myUser?> getMyUser();

  Future<void> saveMyUser(myUser user, File? image);

}