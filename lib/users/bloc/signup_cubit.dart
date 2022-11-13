import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/users/bloc/signup_state.dart';
import '../resources/auth_resources.dart';

class signup_cubit extends Cubit<signup_state>{
  final auth_resources _auth_resources;
  signup_cubit(this._auth_resources) : super(signup_state.initial());

  void emailChanged(String value){
    emit(
      state.copyWith(
        email: value,
        status: signup_status.initial,
      ),
    );
  }

  void pswdChanged(String value){
    emit(
        state.copyWith(
          pswd: value,
          status: signup_status.initial,
        ),
    );
  }
  Future<void> signupFormSubmitted() async {
    if(state.status == signup_status.submitting) return;
    emit(state.copyWith(status: signup_status.submitting));
    try {
      await _auth_resources.signup(email: state.email,
          pswd: state.pswd);
      emit(state.copyWith(status: signup_status.sucess));
    }catch (_) {}
    }

  }
