
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/service/user_service.dart';
import 'package:untitled/ui/util/gradientBack.dart';

import 'package:untitled/ui/util/normal_button.dart';



import '../../../modelos/User.dart';
import 'package:untitled/service/auth_service.dart';
import '../util/button_bar.dart';
import '../util/user_info.dart';
import '../../../ui/screens/login.dart';



class perfil_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final authService = AuthService();
    final userService = UserService();



    // return Text("hola");

    final header = Stack(
        children: [
          gradientBack("Perfil"),
          user_info(),
        ]
    );

    return Scaffold(
      body: Center(
        child: ListView(
            children: [
              header,
              button_bar(),
              description_txt("Nombre:", "{}"),
              description_txt("Apellidos:", "{}"),
              description_txt("Email:", "{}"),
              description_txt("Puesto de trabajo:", "{}"),
              description_txt("Provincia:", "{}"),
              description_txt("Centro de trabajo:", "{}"),
        ]
        ),
      ),
    );
  }
}
class description_txt extends StatelessWidget {

  String titulo = "";
  String? txt = "";

  description_txt(this.titulo, this.txt);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0,),
          Text(
            txt?? '',
            style: TextStyle(
            color: Colors.black26,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          ),
        ],
      ),
    );
  }
}

  




