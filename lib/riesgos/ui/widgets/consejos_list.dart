import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/consejo.dart';

class consejos_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        consejo("01",
            "Este consejo de hoy es para recordarte que tienes q sentarte bn",
            5)
        //aquí crearía más consejos, supongo q depende BD
      ],
    );
  }
}