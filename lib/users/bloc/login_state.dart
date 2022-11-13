import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


enum login_status {initial, submitting, success, error}

class login_state extends Equatable{
  final String email;
  final String pswd;
  final login_status status;

  const login_state({
  required this.email,
  required this.pswd,
  required this.status});

  factory login_state.initial(){
    return const login_state(
        email: '',
        pswd: '',
        status: login_status.success);
  }

  List<Object> get props => [email,pswd,status];

  login_state copyWith({
  String ? email,
    String? pswd,
    login_status? status,
}) {
    return login_state(
        email: email ?? this.email,
        pswd: pswd ?? this.pswd,
        status: status ?? this.status
    );
  }

}