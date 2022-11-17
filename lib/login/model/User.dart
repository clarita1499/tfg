import 'dart:convert';

import 'package:untitled/riesgos/model/Consejo.dart';
import 'package:equatable/equatable.dart';

class myUser extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final int age;
  final List <myConsejo> myFavoriteConsejos;
  final List <myConsejo> myConsejos;

  final String? image;

  myUser(this.id, this.name, this.lastname, this.email,this.age, this.myFavoriteConsejos,this.myConsejos,{this.image});

  List<Object?> get props => [id];

  //para ayudar a guardar el objeto en la BD de firebase
  Map <String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastName': lastname,
      'email' : email,
      'age': age,
      'image': newImage ?? image,
      'consejosFav' : myFavoriteConsejos,
      'myConsejos' : myConsejos,
    };
  }
  myUser.fromFirebaseMap(Map<String,Object?> data):
        id = data['id'] as String,
        name = data['name'] as String,
        lastname = data['lastname'] as String,
        email = data['email'] as String,
        age = data['age'] as int,
        image = data ['image'] as String?,
        myFavoriteConsejos = data['consejosFav'] as List<myConsejo>,
        myConsejos = data['myconsejos'] as List<myConsejo>
  ;

//https://www.youtube.com/watch?v=wOikvODRQ4s


}