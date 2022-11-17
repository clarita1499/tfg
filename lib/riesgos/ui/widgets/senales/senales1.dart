import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_senales.dart';

class senales1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final txt_prohibicion = Text(
      "Señales de prohibición:",
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final prohibicion1 = Row(
      children: [
        image_senales(
            "assets/prohibicion/prohibido_animales.png",
                () {

                }
        ),
        image_senales(
            "assets/prohibicion/prohibido_apagar_agua.png",
                () { }
        ),
        image_senales(
            "assets/prohibicion/prohibido_encender_fuego.jpg",
                () { }
        ),
        image_senales(
            "assets/prohibicion/prohibido_fogatas.jpg",
                () {}
        ),
        image_senales(
            "assets/prohibicion/prohibido_fumar.png",
                () {}
        ),
      ],
    );
    final prohibicion2 = Row(
      children: [
        image_senales(
            "assets/prohibicion/prohibido_no fotos.jpg",
                () { }
        ),
        image_senales(
            "assets/prohibicion/prohibido_solo_personal_autorizado.jpg",
                () { })
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
         txt_prohibicion,
         prohibicion1,
         prohibicion2
       ],
     ),
         );

  }

}