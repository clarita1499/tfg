
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/main.dart';
import 'package:untitled/riesgos/repository/myConsejo_repository.dart';

import '../../riesgos/model/Consejo.dart';

class HomeCubit extends Cubit<HomeState> {

  final MyConsejoRepository _consejoRepository = getIt();
  StreamSubscription? _myConsejosSubscription;

  HomeCubit() : super(HomeState());

  Future<void> init() async {
    _myConsejosSubscription =
        _consejoRepository.getMyConsejos().listen(myConsejoListen);
  }

  void myConsejoListen(Iterable<MyConsejo> myConsejos) async {
    emit(HomeState(
      isLoading: false,
      myConsejos: myConsejos,
    ));
  }
  Future<void> close(){
    _myConsejosSubscription?.cancel();
    return super.close();
  }
}


class HomeState extends Equatable{
  final bool isLoading;
  final Iterable<MyConsejo> myConsejos;


  HomeState({
    this.isLoading = true,
    this.myConsejos = const []
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, myConsejos];

}