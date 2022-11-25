
import '../model/Consejo.dart';

abstract class MyConsejoRepository {
  //String newId();

  Stream<Iterable<MyConsejo>> getMyConsejos();

  Future<void> saveMyConsejo(MyConsejo myConsejo);

  Future<void> deleteMyConsejo(MyConsejo myConsejo);
}