
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class senales_incendio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final description = Column(
      children: [
        description_txt("1.", "Avisador sonoro"),
        description_txt("2.", "Extintor contra incendio"),
        description_txt("3.", "Mangera contra incendios"),
        description_txt("4.", "Pulsador de alarma"),
        description_txt("5.", "Telefono contra incendios"),
        description_txt("6.", "Dirección derecha "),
        description_txt("7.", "Dirección arriba"),
      ],
    );

    final row1_senales = Row(
      children: [
        image_riesgos("assets/incendio/avisador_sonoro.png", "1"),
        const SizedBox(height: 5),
        image_riesgos("assets/incendio/extintor.png","2"),
        const SizedBox(height: 5),
        image_riesgos("assets/incendio/mangera.png","3"),
        const SizedBox(height: 5),
        image_riesgos("assets/incendio/pulsador_alarma.png","4")
      ],
    );

    final row2_senales = Row(
      children: [
        image_riesgos("assets/incendio/telefono_incendio.png", "5"),
        const SizedBox(height: 5),
        image_riesgos("assets/incendio/direccion_derecha.png", "6"),
        const SizedBox(height: 5),
        image_riesgos("assets/incendio/direccion_arriba.png","7"),
        const SizedBox(height: 5),
      ],
    );


    final images = Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          row1_senales,
          row2_senales,
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Señales contra incendio"),
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


