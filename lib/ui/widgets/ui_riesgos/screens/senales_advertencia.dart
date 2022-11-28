
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class senales_advertencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final description = Column(
    children: [
      description_txt("1.", "Riesgo sustancias inflamables"),
      description_txt("2.", "Riesgo eléctrico"),
      description_txt("3.", "Aviso de peligro"),
      description_txt("4.", "Aviso de peligro general"),
      description_txt("5.", "Riesgo a tropezar"),
      description_txt("6.", "Riesgo a distinto nievel"),
      description_txt("7.", "Aviso suelo resbaladizo"),
      description_txt("8.", "Riesgo materias explosivas"),
      description_txt("9.", "Riesgo de materias radiactivas"),
    ],
    );

    final row1_senales = Row(
    children: [
      image_riesgos("assets/advertencia/sustancias_inflamables.png", "1"),
      const SizedBox(height: 5),
      image_riesgos("assets/advertencia/riesgo_electrico.png","2"),
      const SizedBox(height: 5),
      image_riesgos("assets/advertencia/aviso_peligro.jpg","3"),
      const SizedBox(height: 5),
      image_riesgos("assets/advertencia/aviso_general.png","4")
    ],
    );

    final row2_senales = Row(
    children: [
      image_riesgos("assets/advertencia/riesgo_tropezar.png", "5"),
      const SizedBox(height: 5),
      image_riesgos("assets/advertencia/aviso_escaleras.png", "6"),
      const SizedBox(height: 5),
      image_riesgos("assets/advertencia/suelo_resbaladizo.png","7"),
      const SizedBox(height: 5),
      image_riesgos("assets/advertencia/riesgo_explosion.png", "8"),
    ],
    );

    final row3_senales = Row(
      children: [
        image_riesgos("assets/advertencia/materias_radiactivas.png", "9"),
        const SizedBox(height: 5),
      ],
    );

    final images = Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          row1_senales,
          row2_senales,
          row3_senales
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Señales de advertencia"),
        ),
    body: ListView(
      children: [
        description,
        images,
      ],
    )
    );
  }
}


class image_riesgos extends StatelessWidget{

  String imagePath = "";
  String txt_bottom = "";

  image_riesgos(this.imagePath,this.txt_bottom);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final image = SizedBox.fromSize(
      size: Size(70,70),
      child: Image.asset(imagePath),
    );

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children : [
          image,
          Text(txt_bottom),
        ],
      ),
    );
  }
}

class description_txt extends StatelessWidget{

  String num = "";
  String txt = "";

  description_txt(this.num, this.txt);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container (
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            num,
            style:TextStyle(
              color: Colors.amber,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(txt)
        ],
      ),
    );
  }


}

