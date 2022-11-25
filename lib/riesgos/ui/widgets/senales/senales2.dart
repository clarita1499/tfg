import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_senales.dart';

class senales2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final txt_salvamento = Text(
      "Señales de Salvamento:",
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final salvamento1 = Row(
      children: [
        image_senales(
            "assets/salvamento/aviso_extintor.jpg",
             //   () {}
        ),
        image_senales(
            "assets/salvamento/escalera_emergencia.png",
            //    () {}
        ),
        image_senales(
            "assets/salvamento/salida_emergencia.jpg",
           //     () {}
        ),
        image_senales(
            "assets/salvamento/salida_exit.jpg",
           //     () {}
        ),
      ],
    );

    return Padding(
        padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
    ),
    child: Column(
      children: [
        txt_salvamento,
        salvamento1,
      ],
    ),
    );
  }
}