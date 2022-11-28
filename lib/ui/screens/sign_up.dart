


import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/service/auth_service.dart';
import 'package:untitled/ui//util/button_inkWell.dart';
import 'package:untitled/navigation/Navigation.dart';
import '../util/snackbar_util.dart';

class SignUp extends StatefulWidget{
  static Widget create(BuildContext context) => SignUp();

  @override
  State<StatefulWidget> createState() => _signup_screen();
  }

class _signup_screen extends State <SignUp> {

  final _formKey = GlobalKey<FormState>();
  final name_controler = new TextEditingController();
  final lastName_controler = new TextEditingController();
  final email_controler = new TextEditingController();
  final pswd_controler = new TextEditingController();
  final pswd2_controler = new TextEditingController();

  final authService = AuthService();

  DateTime date = DateTime(2022,12,24);


  String ? emailValidator(String? value){
    return (value == null || value.isEmpty) ? 'Este campo es obligatorio' : null;
  }
  String? pswdValidator(String? value){
    if (value == null || value.isEmpty) return 'Este campo es obligatorio';
    if(value.length <6) return "La contraseña debe tener más de 6 carácteres";
    if (pswd_controler.text != pswd2_controler.text) return "Las contraseñas deben coincidir";
    return null;
  }

  signUpClick(BuildContext context) async {
    print('Register function');
      try {
        String name = name_controler.text;
        String email = email_controler.text.toLowerCase();
        String password = pswd_controler.text;

        final userCredential = await authService.registerUserWithEmailAndPassword(
            name,
            email,
            password
        );

        print('user credential: ${userCredential}');
        if (userCredential != null) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Navigation()));
        }else{
          SnackBarUtil.showWarningSnackBar('Error en la creación', context);
        }

      } on FirebaseAuthException catch (e) {
        print('firebase exception: ${e.message}');
        SnackBarUtil.showWarningSnackBar('Error ${e.message}', context);
      }
    }

  Widget build(BuildContext context) {

    final txtName = TextFormField(
      controller: name_controler,
      decoration: const InputDecoration(
          hintText: 'Nombre'
      ),
      validator: emailValidator,
    );
    final txtLastName = TextFormField(
      controller: lastName_controler,
      decoration: const InputDecoration(
          hintText: 'Apeliido'
      ),
      validator: emailValidator,
    );

    final txtEmail = TextFormField(
      controller: email_controler,
      validator: emailValidator,
      decoration: const InputDecoration(
          hintText: 'usuario@correo.com'
      ),
    );

    final txtPswd = TextFormField(
      controller: pswd_controler,
      obscureText: true,
      validator: pswdValidator,
      decoration: const InputDecoration(
          hintText: 'contraseña'
      ),
    );

    final txt2Pswd = TextFormField(
      controller: pswd2_controler,
      obscureText: true,
      validator: pswdValidator,
      decoration: const InputDecoration(
          hintText: 'Repite contraseña'
      ),

    );


    final buttonLognUp = button_inkWell(
        button_txt: "Registrar",
        onPressed: () {
            signUpClick(context);
          }
        );

        return Scaffold(
          appBar: AppBar(title: Text("Registro"),),
        body : Form(
           child: Padding(
             padding:  const EdgeInsets.all(16.0),
             child: Column(
             children: [
               txtName,
               txtLastName,
               txtEmail,
               SizedBox(height: 8),
               txtPswd,
               SizedBox(height: 8),
               txt2Pswd,
               SizedBox(height: 8),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   buttonLognUp,
                 ],
               ),
             ],
             ),
           ),
        ),
     );
  }
}











