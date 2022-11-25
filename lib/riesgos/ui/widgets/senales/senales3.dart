import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_senales.dart';

class senales3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final txt_advertencia = Text(
      "Señales de advertencia:",
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final advertencia1 = Row(
      children: [
        image_senales(
            "assets/riesgo/aviso_escaleras.png",
              //  () {}
        ),
        image_senales(
            "assets/riesgo/aviso_general.png",
            //    () {}
        ),
        image_senales(
            "assets/riesgo/aviso_peligro.jpg",
           //     () {}
        ),
        image_senales(
            "assets/riesgo/riesgo_electrico.png",
           //     () {}
        ),
        image_senales(
            "assets/riesgo/riesgo_tropezar.jpg",
            //    () {}
        ),
      ],
    );
    final advertencia2 = Row(
      children: [
        image_senales(
            "assets/riesgo/suelo_resbaladizo.jpg",
           //     () {}
        ),
        image_senales(
            "assets/riesgo/sustancias_inflamables.png",
        //      () {})
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
        txt_advertencia,
        advertencia1,
        advertencia2
      ],
    ),
    );
  }
}