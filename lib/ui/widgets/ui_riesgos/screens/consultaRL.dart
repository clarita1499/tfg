import 'package:flutter/material.dart';
import 'package:untitled/ui/util/gradientBack.dart';

class consultarRL extends StatelessWidget {
  int type;
  String id;
  String titulo;
  String description;
 // String descripcion_riesgo;

  consultarRL(this.type, this.id, this.titulo, this.description);

  @override
  Widget build(BuildContext context) {
    final txt_type = Container(
      margin: EdgeInsets.only(
        top: 50,
        right: 3.0
      ),
      child: Text(
        type.toString(),
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w900
        ),
        textAlign: TextAlign.left,
      ),
    );

    final txt_riesgo = Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 250.0,
                left: 20.0,
                right: 20.0
            ),
            child: Text(
              id,
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            children: <Widget>[
              Container (
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ]
    );
    return Column(
      children: [
        gradientBack("Búsqueda de riesgos"),
        txt_riesgo
      ],
    );
  }
}