import 'package:cloud_firestore/cloud_firestore.dart';

import '../modelos/User.dart';

class UserService{
  Future<MyUser?> get (String email) async{
    var userFirebase =  await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email).get();

    if(userFirebase.size>=1){
      var firstUserFound = userFirebase.docs.first;
      if(firstUserFound.exists){
        return MyUser.fromFirebaseMap(firstUserFound.data());
      }
    }
    return null;
  }

  add (String id,MyUser myUser) async{
    try{
      await FirebaseFirestore.instance.collection('user').doc(id).
      set(myUser.toFirebaseMap(),SetOptions(merge: true));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}