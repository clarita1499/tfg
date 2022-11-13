import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/riesgos/ui/widgets/gradientBack.dart';
import 'package:untitled/riesgos/ui/widgets/gradient_logo.dart';
import 'package:untitled/riesgos/ui/widgets/review_list.dart';
import 'package:untitled/riesgos/ui/screens/senales.dart';
import 'package:untitled/riesgos/ui/widgets/consejos_list.dart';
import 'package:untitled/users/bloc/user_bloc.dart';

class bienvenida extends StatelessWidget {

  const bienvenida({Key? key}) : super (key: key);

  static Page pages() =>
      const MaterialPage(child: bienvenida());

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        gradient_logo("INICIO"),
        details_bienvenida(),
        list_view_review()
      ],
    );
  }
}


class description extends StatelessWidget {
  String txt_bienvenida = "HOLA ESTE TEXTO LO TENGO QUE HACER";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0
      ),
      child: new Text(
        txt_bienvenida,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a),
        ),
      ),
    );
  }
}

class titulo_bienvenida extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
    margin: EdgeInsets.only(
        top: 325.0,
        left: 20.0,
        right: 20.0
    ),
      child: new Text(
        "Bienvenid@ a UniTER",
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class details_bienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        titulo_bienvenida(),
        description()
      ],
    );
  }
}

class list_view_review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   ListView(
      children: <Widget>[
        consejos_list(),
        review_list(),
      ],
    );
  }
}



