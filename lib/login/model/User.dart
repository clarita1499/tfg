
import 'package:equatable/equatable.dart';

class myUser extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final int age;

  final String? image;


  myUser(this.id, this.name, this.lastname, this.age, {this.image});


  List<Object?> get props => [id];

  //para ayudar a guardar el objeto en la BD de firebase
  Map <String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastName': lastname,
      'age': age,
      'image': newImage ?? image,
    };
  }
  myUser.fromFirebaseMap(Map<String,Object?> data):
        id = data['id'] as String,
        name = data['name'] as String,
        lastname = data['lastname'] as String,
        age = data['age'] as int,
        image = data ['image'] as String?;

//https://www.youtube.com/watch?v=wOikvODRQ4s
}