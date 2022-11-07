import 'package:flutter/material.dart';

class consultarRL extends StatelessWidget {
  String categoria;
  String cod_riesgo;
  String nombre_riesgo;
 // String descripcion_riesgo;

  consultarRL(this.categoria, this.cod_riesgo, this.nombre_riesgo);

  @override
  Widget build(BuildContext context) {
    final txt_categoria = Container(
      margin: EdgeInsets.only(
        top: 50,
        right: 3.0
      ),
      child: Text(
        categoria,
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
              cod_riesgo,
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
                  nombre_riesgo,
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
    return txt_riesgo;
  }
}