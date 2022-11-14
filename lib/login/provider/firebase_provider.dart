import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;
import '../model/User.dart';

class FirebaseProvider{

  //ayudan a obtener storage o fiestore
  FirebaseStorage get storage =>
      FirebaseStorage.instance;
  FirebaseFirestore get firestore =>
      FirebaseFirestore.instance;

  User get currentUser{
    final user = FirebaseAuth.instance.currentUser;
    if(user==null)
      throw Exception("Not authenticated exception");
    return user;
  }
  Future<myUser?> getMyUser() async{
    final snapshot = await firestore.doc('user/${currentUser.uid}').get();
    if(snapshot.exists) return myUser.fromFirebaseMap(snapshot.data()!);
    return null; //si es la primera vez que inicia sesión, no hay información sobre ese usuario
  }
  Future<void> saveMyUser(myUser user, File? image) async{
    final ref = firestore.doc('user/${currentUser.uid}');
    if(image == null) { //solo tengo que actualizar si ya existe una imagen
      await ref.set(user.toFirebaseMap(),SetOptions(merge:true));
    }else{
      final imagePath = '${currentUser.uid}/profile/${path.basename(image.path)}'; //ruta de la imagen
      final storageRef = storage.ref(imagePath); //le paso la imagen
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      await ref.set(user.toFirebaseMap(newImage: url),SetOptions(merge:true)); //para obtener la url de la imagen, encontrado en storage
    }
  }
}
