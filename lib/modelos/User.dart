import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/modelos/Consejo.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/modelos/Riesgo.dart';

class MyUser  {
  final String? name;
  final String? lastname;
  final String? email;
  final String? image;
  final String? work;
  final String? university;
  final String? direction;
  final String? CP;
  final String? city;
  final List <MyConsejo>? myFavoriteConsejos;
  final List <MyConsejo>? myConsejos;
  DocumentReference? reference;



  MyUser(this.name, this.lastname, this.email,
      {this.image, this.work, this.university,
        this.direction, this.CP, this.city, this.myFavoriteConsejos, this.myConsejos
        });

  //Esto es para comparar dos instancias de un usuario, para comprobar si es el mismo usuario
  List<Object?> get props =>
      [name, lastname, email, image, work, university, direction,
        direction, CP, city, myFavoriteConsejos, myConsejos];

  //para ayudar a guardar el objeto en la BD de firebase
  Map <String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'name': name,
      'lastName': lastname,
      'email': email,
      'image': image,
      'work': work,
      'university': university,
      'direction': direction,
      'CP': CP,
      'city': city,
      'consejosFav': myFavoriteConsejos,
      'myConsejos': myConsejos,
    };
  }

  //para convertir una instancia de usuario en un map
  MyUser.fromFirebaseMap(Map<String, Object?> data):
        name = data['name'] as String,
        lastname = data['lastname'] as String,
        email = data['email'] as String,
        image = data['image'] as String?,
        work = data['work'] as String?,
        university = data['university'] as String?,
        direction = data['direction'] as String?,
        CP = data['CP'] as String?,
        city = data['city'] as String?,
        myFavoriteConsejos = data['consejosFav'] as List<MyConsejo>,
        myConsejos = data['myconsejos'] as List<MyConsejo>,
        reference = data['reference'] as DocumentReference;

  //para actualizar algunas propiedades de la instacia y devuelve la instancia del usuario actualizada

  MyUser copyWith({
    String? name,
    String? lastname,
    String? email,
    String? image,
    String? work,
    String? university,
    String? direction,
    String? CP,
    String? city,
    List <MyConsejo>? myFavoriteConsejos,
    List <MyConsejo>? myConsejos,
  }) {
    return MyUser(
      name ?? this.name,
      lastname ?? this.lastname,
      email ?? this.email,
      image: image ?? this.image,
      work: work ?? this.work,
      university: university ?? this.university,
      direction: direction ?? this.direction,
      CP: CP ?? this.CP,
      city: city ?? this.city,
      myFavoriteConsejos: myFavoriteConsejos ?? this.myFavoriteConsejos,
      myConsejos: myConsejos ?? this.myConsejos,
    );
  }

}
