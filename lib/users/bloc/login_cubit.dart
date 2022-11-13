import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/users/bloc/login_state.dart';
import 'package:untitled/users/resources/auth_resources.dart';

class login_cubit extends Cubit <login_state>{
  final auth_resources _auth_resources;

  login_cubit(this._auth_resources) : super (login_state.initial());

  void email_changed (String value) {
    emit(state.copyWith(email: value, status:  login_status.initial));
  }

  void pswd_changed (String value) {
    emit(state.copyWith(pswd: value, status:  login_status.initial));
  }

  Future<void> logiWithCredentials() async{
    if(state.status == login_status.submitting)return;
    emit(state.copyWith(status: login_status.submitting));
    try {
      await _auth_resources.login_with_email_and_password(
          email: state.email, pswd: state.pswd);
      emit(state.copyWith(status: login_status.success));
    } catch (_) {}
  }

}