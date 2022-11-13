import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/screens/bienvenida.dart';
import 'package:untitled/users/bloc/user_bloc.dart';
import 'package:untitled/users/bloc/user_state.dart';
import 'package:untitled/users/ui/screens/login.dart';

List<Page> onGenerateAppViewPages(
    user_status state,
    List<Page<dynamic>> pages

    ){
  switch(state){
    case user_status.authenticated:
      return [bienvenida.pages()];
      case user_status.unathenticated:
        return [login_screen.pages()];
  }
}

