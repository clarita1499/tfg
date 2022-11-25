import 'package:equatable/equatable.dart';

class mySenal extends Equatable{
  final String id;
  final int type;
  final String imagePath;
  final String description;

  mySenal(this.id, this.type, this.imagePath, this.description);

  List<Object?> get props => [id];

  Map <String, Object?> toFirebaseMap() {
    return <String, Object?>{
      'id': id,
      'type': type,
      'image': imagePath,
      'description': description,
    };
  }
  mySenal.fromFirebaseMap(Map<String,Object?> data):
        id = data['id'] as String,
        type = data['type'] as int,
        imagePath = data ['image'] as String,
        description = data['description'] as String;

//https://www.youtube.com/watch?v=wOikvODRQ4s
}
