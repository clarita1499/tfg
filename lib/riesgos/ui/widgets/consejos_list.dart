import 'package:flutter/material.dart';
import 'package:untitled/login/model/User.dart';
import 'package:untitled/riesgos/model/Consejo.dart';
import 'package:untitled/riesgos/ui/widgets/Consejo_view.dart';

class consejos_list extends StatelessWidget {

  myConsejo consejo1 = new myConsejo(
    "01",
    "Espalda sana",
    "Este consejo de hoy es para recordarte que tienes q sentarte bn",
  );

  myConsejo consejo2 = new myConsejo(
    "02",
    "Cuida tu vista",
    "La pantalla afecta muy negativamente a los ojos, descansa cada hora 5 minutos",
  );

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Consejo_view(consejo1),
        Consejo_view(consejo2),
        //aquí crearía más consejos, supongo q depende BD
      ],
    );
  }
}