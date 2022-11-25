import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/User/model/User.dart';
import 'package:untitled/riesgos/model/Consejo.dart';

class FirebaseDataSource {
  User get currentUser{
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("Fallo en la autenticación");
    return user;
  }

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  Stream<Iterable<MyUser>> getMyUsers() {
    return firestore.collection('user/${currentUser.uid}/myUsers')
        .snapshots().map((it) => it.docs.map((e) => MyUser.fromFirebaseMap(e.data())));
  }

  Future<void>saveMyUser(MyUser myUser, File? image) async{
    final ref = firestore.doc('user/${currentUser.uid}/myUsers/${myUser.id}');
    if (image != null){
      if(myUser.image != null){
        await storage.refFromURL(myUser.image!).delete();
      }

      final fileName = image.uri.pathSegments.last;
      final imagePath = '${currentUser.uid}/myUsersImage/$fileName';

      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      myUser = myUser.copyWith(image: url);
    }
    await ref.set(myUser.toFirebaseMap(), SetOptions(merge: true));
  }

  Future<void> deleteMyUser(MyUser myUser) async{
    final ref = firestore.doc('user/${currentUser.uid}/myUsers/${myUser.id}');

    if(myUser.image != null){
      await storage.refFromURL(myUser.image!).delete();
    }
    await ref.delete();
  }

  Stream<Iterable<MyConsejo>> getMyConsejos() {
    return firestore.collection('consejos/myConsejos')
        .snapshots().map((it) => it.docs.map((e) => MyConsejo.fromFirebaseMap(e.data())));
  }

  Future<void>saveMyConsejo(MyConsejo myConsejo) async{
    final ref = firestore.doc('consejos/myConsejos/${myConsejo.id}');
    await ref.set(myConsejo.toFirebaseMap(), SetOptions(merge: true));
  }

  Future<void> deleteMyConsejo(MyConsejo myConsejo) async{
    final ref = firestore.doc('consejos/myConsejos/${myConsejo.id}');
    await ref.delete();
  }

}