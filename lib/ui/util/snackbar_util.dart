import 'package:flutter/material.dart';

class SnackBarUtil {

  static void showWarningSnackBar(String msg, BuildContext context) {
    final snackBar = SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),), backgroundColor: Colors.red);
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
  }

  static void showSnackBar(String msg, BuildContext context) {
    final snackBar = SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),), backgroundColor: Colors.green);
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
  }
}
