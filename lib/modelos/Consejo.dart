import 'package:equatable/equatable.dart';

import 'User.dart';


class MyConsejo extends Equatable {
  final String id;
  final String titulo;
  final String description;
  final int? likes;
  final String? image;
  final MyUser? userOwner;


  MyConsejo(this.id, this.titulo, this.description, {this.image,this.likes,this.userOwner});


  List<Object?> get props => [id];

  //para ayudar a guardar el objeto en la BD de firebase
  Map <String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'titulo': titulo,
      'description': description,
      'image': newImage ?? image,
      'likes' : 0 ?? likes,
      'userOwner' : userOwner,
    };
  }
  MyConsejo.fromFirebaseMap(Map<String,Object?> data):
        id = data['id'] as String,
        titulo = data['titulo'] as String,
        description = data['description'] as String,
        image = data ['image'] as String?,
        likes = data['likes'] as int?,
        userOwner = data['userOwner'] as MyUser;

//https://www.youtube.com/watch?v=wOikvODRQ4s
}