
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/ui_riesgos/widgets/consejos_list.dart';
import '../widgets/ui_riesgos/widgets/headerAppBar.dart';
import '../widgets/ui_riesgos/widgets/review_list.dart';

class bienvenida extends StatelessWidget {
  static Widget create(BuildContext context) => bienvenida();

  const bienvenida({
    Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    String texto = "Uno de los principales objetivos de la Universidad Poltécnica de Teruel"
        "es ofrecer una enseñanza de calidad, centrándose en el bienestar del alumnado, y para"
        " ello el principal factor es el bienestar de sus trabajadores, ya que son los actores"
        " principales de estos centros.";
    String texto1 = "Esto se consigue ofreciendo un entorno de trabajo de calidad y para ello,"
        " es necesario integrar todos los aspectos relacionados con la prevención de los riesgos, "
        "garantizando la seguridad de todas las personas que trabajan, estudian y participan en actividades"
        " relacionadas y propuestas por esta univerdidad.";
    String texto2 = "Uniter es una aplicación que ayuda a asesorar a los trabajadores de las universidades "
        "sobre todos los posibles riesgos y medidas preventivas a las que se enfrentan, "
        "además a través de esta aplicación se pueden consultar imágenes sobre las señales que se "
        "pueden encontrar alrededor de la universidad, también se puede crear consejos que puedan"
        " ayudar a los demás usuarios a mejorar sus condiciones diarias y, por último, se puede"
        " consultar sugerencias al realizar tareas específicas. ";
    String texto3 = "Esta aplicación no solo está dedicada a los trabajadores, si no que también"
        "sirve para concienciar y dar a conocer los riesgos laborales para todas aquellas personas que estén"
        "interesadas.";

    final titulo_bienvenida = Container(
      margin: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: const Text(
        "Bienvenid@ a UniTER",
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.center,
      ),
    );

    final txtBienvenida = Container(
      margin: const EdgeInsets.only(
          top: 20.0,
          left: 5.0,
          right: 5.0

      ),
      child: Text(
        texto,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.black87
        ),
      ),
    );
    final txtBienvenida1 = Container(
      margin: const EdgeInsets.only(
          top: 20.0,
          left: 5.0,
          right: 5.0

      ),
      child: Text(
        texto1,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.black87
        ),
      ),
    );
    final txtBienvenida2 = Container(
      margin: const EdgeInsets.only(
          top: 20.0,
          left: 5.0,
          right: 5.0

      ),
      child: Text(
        texto2,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.black87
        ),
      ),
    );
    final txtBienvenida3 = Container(
      margin: const EdgeInsets.only(
          top: 20.0,
          left: 5.0,
          right: 5.0

      ),
      child: Text(
        texto3,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.black87
        ),
      ),
    );
    final tituloConsejos = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 10.0,
          right: 20.0
      ),
      alignment: Alignment.topLeft,
      child: const Text(
        "Consejos:",
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: "Lato",
          fontSize: 20.0,
          fontWeight: FontWeight.w900, //negrita
        ),
      ),
    );

    final texto_completo = Column(
      children: [
        txtBienvenida,
        txtBienvenida1,
        txtBienvenida2,
        txtBienvenida3
      ],
    );
    final details = Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            texto_completo,
            tituloConsejos
          ]
      ),
    );


    return Scaffold(
          body: ListView(
            children: <Widget>[
             // Text('User: ${authUser.uid}'),
              HeaderAppBar(),
              details,
              consejos_list(),
              review_list(),
            ],
          ),
    );
  }
}

