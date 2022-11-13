import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum signup_status {initial, submitting, sucess, error}

class signup_state extends Equatable{
  final String email;
  final String pswd;
  final signup_status status;

  const signup_state({
    required this.email,
    required this.pswd,
    required this.status,
});

  factory signup_state.initial(){
    return const signup_state(
        email: '',
        pswd: '',
        status: signup_status.initial,
    );
  }
  signup_state copyWith({
  String ? email,
    String ? pswd,
    signup_status? status
}) {
    return signup_state(
        email: email ?? this.email,
        pswd: pswd ?? this.pswd,
        status: status ?? this.status,
    );
  }

  List<Object?> get props => [email,pswd,status];
}