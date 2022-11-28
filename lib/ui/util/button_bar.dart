import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/edit_perfil.dart';
import 'package:untitled/service/auth_service.dart';

import '../screens/login.dart';
import '../widgets/ui/widgets/circle_button.dart';

class button_bar extends StatelessWidget{
  //late bloc_user user_bloc;

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //user_bloc = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0
        ),
      child: Row(
        children: <Widget>[
          //cambiar la contraseña
          circle_button(true, Icons.vpn_key,20.0, Color.fromRGBO(255,255,255,0.6)
              , onPressed: () {}),
          //cambiar los datos
          circle_button(false, Icons.person_add, 40.0, Color.fromARGB(255,255,255,3)
              ,onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new edit_perfil()),);
              }),
          //cerrar de la sesión
          circle_button(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () {
            _authService.signOut();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new Login()),);
              }
              ),
        ],
      ),
    );
  }
}