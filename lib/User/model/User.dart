import 'dart:convert';

import 'package:untitled/riesgos/model/Consejo.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final int age;
  final String? image;
  final String? work;
  final String? university;
  final String? direction;
  final String? CP;
  final String? city;
  final List <MyConsejo>? myFavoriteConsejos;
  final List <MyConsejo>? myConsejos;


  MyUser(this.id, this.name, this.lastname, this.email, this.age,
      {this.image, this.work, this.university,
        this.direction, this.CP, this.city, this.myFavoriteConsejos, this.myConsejos});

  //Esto es para comparar dos instancias de un usuario, para comprobar si es el mismo usuario
  List<Object?> get props =>
      [id, name, lastname, age, email, image, work, university, direction,
        direction, CP, city, myFavoriteConsejos, myConsejos];

  //para ayudar a guardar el objeto en la BD de firebase
  Map <String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastName': lastname,
      'email': email,
      'age': age,
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
  MyUser.fromFirebaseMap(Map<String, Object?> data)
      :
        id = data['id'] as String,
        name = data['name'] as String,
        lastname = data['lastname'] as String,
        email = data['email'] as String,
        age = data['age'] as int,
        image = data['image'] as String?,
        work = data['work'] as String?,
        university = data['university'] as String?,
        direction = data['direction'] as String?,
        CP = data['CP'] as String?,
        city = data['city'] as String?,
        myFavoriteConsejos = data['consejosFav'] as List<MyConsejo>,
        myConsejos = data['myconsejos'] as List<MyConsejo>;

  //para actualizar algunas propiedades de la instacia y devuelve la instancia del usuario actualizada

  MyUser copyWith({
    String? id,
    String? name,
    String? lastname,
    String? email,
    int? age,
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
      id ?? this.id,
      name ?? this.name,
      lastname ?? this.lastname,
      email ?? this.email,
      age ?? this.age,
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
