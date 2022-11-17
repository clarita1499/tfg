import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/login/model/User.dart';

class CloudFirestoreAPI {
  //nombres de mis colecciones

  final String USERS = "users";
  final String CONSEJOS = "consejos";

  //trae la entidad de la base de datos y la deja disponible para poder insertarla
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData (myUser) async{

  }
}