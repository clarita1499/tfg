
import '../../../User/repository/Firebase_data_source.dart';
import '../../../main.dart';
import '../../model/Consejo.dart';
import '../myConsejo_repository.dart';

class MyConsejoRepositoryImp extends MyConsejoRepository {

  final FirebaseDataSource _fDataSource = getIt();

  @override
  Future<void> deleteMyConsejo(MyConsejo myConsejo) {
    // TODO: implement deleteMyConsejo
    return _fDataSource.deleteMyConsejo(myConsejo);
  }

  @override
  Stream<Iterable<MyConsejo>> getMyConsejos() {
    // TODO: implement getMyConsejos
    return _fDataSource.getMyConsejos();

  }

  @override
  Future<void> saveMyConsejo(MyConsejo myConsejo) {
    // TODO: implement saveMyConsejo
    return _fDataSource.saveMyConsejo(myConsejo);
  }
}



