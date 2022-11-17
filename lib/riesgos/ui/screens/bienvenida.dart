
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/card_image.dart';
import 'package:untitled/riesgos/ui/widgets/gradientBack.dart';
import 'package:untitled/widgets/menu_principal.dart';
import '../widgets/consejos_list.dart';
import '../widgets/headerAppBar.dart';
import '../widgets/review_list.dart';

class bienvenida extends StatelessWidget {
  static Widget create(BuildContext context) => bienvenida();

  const bienvenida({
    Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    String texto = "HOLA ESTE TEXTO LO TENGO QUE HACER";

    final titulo_bienvenida  = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        "Bienvenid@ a UniTER",
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.center,
      ),
    );

    final txt_bienvenida  = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        texto,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
      ),
    );
    final titulo_consejos = Container(
        margin: EdgeInsets.only(
            top: 20.0,
            left: 10.0,
            right: 20.0
        ),
        child: Text(
            "Consejos:",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: "Lato",
              fontSize: 20.0,
              fontWeight: FontWeight.w900, //negrita
            ),
        ),
      alignment: Alignment.topLeft,
    );

    final details = Container(
      padding: EdgeInsets.all(10.0),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          titulo_bienvenida,
          txt_bienvenida,
          titulo_consejos
    ]
      ),
    );


    //QUIERO HACER QUE EL GRADIENTE SE QUEDE QUIETO, PERO ESQ SI HAGO ESO NO ME SALE EL TXT, LO HARÍA CON UN STACK, TENGO QUE SEGUIR PROBANDO

    return Scaffold(
      body: ListView(
            children: <Widget>[
              HeaderAppBar(),
              details,
              consejos_list(),
              review_list(),
            ],
          ),
         //HeaderAppBar()
        //],
     // ),
    );
  }
    /*MaterialApp(
      home: Padding(
        padding:EdgeInsets.all(20.0),
    child :Stack(
    children: <Widget>[
    ListView(
    children: <Widget>[
    details,
    consejos_list(),
    review_list(),
    ],
    ),
    HeaderAppBar()
    ],
    ),
    ),
    );
  }

     */

    /*Padding(
      padding:EdgeInsets.all(20.0),
    child :Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            details,
            consejos_list(),
            review_list(),
          ],
        ),
        HeaderAppBar()
      ],
    ),
    );

     */
  }

