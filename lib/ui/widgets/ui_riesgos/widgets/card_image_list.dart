import 'package:flutter/material.dart';
import 'package:untitled/ui/util/card_image.dart';

class card_image_list extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final prohibido =  Container(
      height: 200.0,
      child: ListView (
        padding: EdgeInsets.all(30.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          card_image("assets/prohibicion/prohibido_animales.png)"),
          card_image("assets/prohibicion/agua.png"),
          card_image("assets/prohibicion/prohibido_encender_fuego.jpg"),
          card_image("assets/prohibicion/prohibido_fogatas.jpg"),
          card_image("assets/prohibicion/prohibido_fumar.png"),
          card_image("assets/prohibicion/prohibido_no fotos.jpg"),
          card_image("assets/prohibicion/prohibido_solo_personal_autorizado.jpg")
        ],
      ),
    );
    /*
    final aviso =  Container(
      height: 200.0,
      child: ListView (
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          card_image("assets/riesgo/aviso_general.png"),
          card_image("assets/riesgo/aviso_escaleras.png"),
          card_image("assets/riesgo/aviso_peligro.jpg"),
          card_image("assets/riesgo/riesgo_electrico.png"),
          card_image("assets/riesgo/riesgo_tropezar.jpg"),
          card_image("assets/riesgo/suelo_resbaladizo.jpg"),
          card_image("assets/riesgo/sustancias_inflamables.png")
        ],
      ),
    );
    final salvamento =  Container(
      height: 200.0,
      child: ListView (
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          card_image("assets/salvamento/aviso_extintor.jpg"),
          card_image("assets/salvamento/escalera_emergencia.png"),
          card_image("assets/salvamento/salida_emergencia.jpg"),
          card_image("assets/salvamento/salida_exit.jpg"),
          card_image("assets/salvamento/señal_baños.jpg"),
        ],
      ),
    );
     final teruel =  Container(
      height: 200.0,
      child: ListView (
        padding: EdgeInsets.all(30.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          card_image("assets/prohibicion/prohibido_animales.png)"),
          card_image("assets/prohibicion/agua.png"),
          card_image("assets/prohibicion/prohibido_encender_fuego.jpg"),
          card_image("assets/prohibicion/prohibido_fogatas.jpg"),
          card_image("assets/prohibicion/prohibido_fumar.png"),
          card_image("assets/prohibicion/prohibido_no fotos.jpg"),
          card_image("assets/prohibicion/prohibido_solo_personal_autorizado.jpg")
        ],
      ),
    );
    return Column(
      children: <Widget>[
        prohibido,
        aviso,
        salvamento
      ],
    );

     */
    return Container(
      height: 300.0,
      child: ListView (
        padding: EdgeInsets.all(30.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          card_image("assets/poli.jpeg"),
          card_image("assets/exteriores.jpg"),
        ],
      ),
    );
  }
}