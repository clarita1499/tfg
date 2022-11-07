import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/gradientBack.dart';
import 'package:untitled/riesgos/ui/widgets/gradient_logo.dart';
import 'package:untitled/riesgos/ui/widgets/review_list.dart';
import 'package:untitled/riesgos/ui/screens/senales.dart';
import 'package:untitled/riesgos/ui/widgets/consejos_list.dart';

class bienvenida extends StatelessWidget {
  //ahora vamos a preparar la clase para cuando tengamos una BD
  String txt_bienvenida = "HOLA ESTE TEXTO LO TENGO QUE HACER";

  @override
  Widget build(BuildContext context) {
    final description = Container(
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

    final titulo_bienvenida =
          Container(
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
                fontWeight: FontWeight.w900, //negrita
              ),
              textAlign: TextAlign.left,
            ),
          );

    final details_bienvenida =
        Column(
          children: <Widget>[
                titulo_bienvenida,
                description
          ],
        );
    final list_view =  ListView(
      children: <Widget>[
        consejos_list(),
        review_list(),
      ],
    );

    return Stack(
      children: <Widget>[
        gradient_logo("INICIO"),
        details_bienvenida,
        list_view
    ],
    );
  }
}

