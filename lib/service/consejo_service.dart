import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/modelos/Consejo.dart';

class ConsejoService{

  Future<MyConsejo?> get(String id) async{
    var consejoFirebase =  await FirebaseFirestore.instance
        .collection('consejo')
        .where('title', isEqualTo: id).get();

    if(consejoFirebase.size>=1){
      var firstConsejoFound = consejoFirebase.docs.first;
      if(firstConsejoFound.exists){
        return MyConsejo.fromFirebaseMap(firstConsejoFound.data());
      }
    }
    return null;
  }

  add (String id,MyConsejo myConsejo) async{
    try{
      await FirebaseFirestore.instance.collection('consejo').doc(id).
      set(myConsejo.toFirebaseMap(),SetOptions(merge: true));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}