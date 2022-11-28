import 'package:flutter/material.dart';
import 'package:untitled/modelos/Consejo.dart';
import 'package:untitled/ui/util/Consejo_view.dart';

class consejos_list extends StatelessWidget {

 MyConsejo consejo1 = new MyConsejo(
    "01",
    "Espalda sana",
    "Este consejo de hoy es para recordarte que tienes q sentarte bn",
  );

  MyConsejo consejo2 = new MyConsejo(
    "02",
    "Cuida tu vista",
    "La pantalla afecta muy negativamente a los ojos, descansa cada hora 5 minutos",
  );

  List <MyConsejo> myconsejos = [];

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Consejo_view(consejo1),
        //aquí crearía más consejos, supongo q depende BD
      ],
    );
  }
}