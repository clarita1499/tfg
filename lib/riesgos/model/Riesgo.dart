import 'package:equatable/equatable.dart';

class myRiesgo extends Equatable {
  final String id;
  final String titulo;
  final String description;
  final int type;


  myRiesgo(this.id, this.titulo, this.description, this.type);

  List<Object?> get props => [id];

  //para ayudar a guardar el objeto en la BD de firebase
  Map <String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'titulo': titulo,
      'description': description,
      'type' : type,
    };
  }
  myRiesgo.fromFirebaseMap(Map<String,Object?> data):
        id = data['id'] as String,
        titulo = data['titulo'] as String,
        description = data['description'] as String,
        type = data['likes'] as int;

//https://www.youtube.com/watch?v=wOikvODRQ4s
}