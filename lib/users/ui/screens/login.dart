import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/screens/bienvenida.dart';
import 'package:untitled/riesgos/ui/widgets/menu_principal.dart';

import '../../../widgets/button_green.dart';
import 'package:untitled/users/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _signInScreen();
  }
}

class _signInScreen extends State<login>{

  late bloc_user userBloc;

  TextEditingController email = new TextEditingController();
  TextEditingController pswd = new TextEditingController();
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return signInGoogleUI();
  }

  Widget _handleCurrentSesion(){
    //lógica para decidir si abro el login o abro la pantalla de bienvenida
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder:( BuildContext context,
            AsyncSnapshot snapshot) {
          //snapshot contiene data - object user desde firebase
          if(snapshot.hasData || snapshot.hasError){
            return signInGoogleUI();
          } else {
            return menu_principal();
          }
        },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
                color: Colors.black38,
                blurRadius: 25.0,
                spreadRadius: 5.0,
                offset: Offset(
                    15.0,15.0
                )
            )
            ],
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png", height: 250,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "usuario@correo.com"
                ),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: pswd,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "contraseña"
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                  icon: Text("Entrar",style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => menu_principal()));
                    },
    //https://www.codigocorrecto.com/flutter/persistencia-de-datos-en-flutter-ejemplo-practico/
    //https://www.youtube.com/watch?v=BbIjKoe-G-g
    //https://esflutter.dev/docs/development/ui/widgets/material
    //https://codea.app/blog/ui-flutter-interfaces

    //body: Review
                  ),
              ),
              button_green( txt:"Entrar con Gmail",
                  width: 300,
                  onPressed: (){
                userBloc.signIn().then((
                    UserCredential user) =>
                    print("El usuario es ${user.user?.displayName}"));
                  },
                  height: 50.0),
              SizedBox(height: 50),
              Text("¿No tienes cuenta? Crea una cuenta")
            ],
          ),
        ),
      ),
    );
  }
}