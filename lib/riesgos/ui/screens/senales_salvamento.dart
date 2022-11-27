import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class senales_salvamento extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      // TODO: implement build

      final description = Column(
        children: [
          description_txt("1.", "Aviso escalera de emergencia"),
          description_txt("2.", "Aviso salida de emergencia"),
          description_txt("3.", "Aviso de dirección a seguir"),
          description_txt("4.", "Aviso de primeros auxilios"),
          description_txt("5.", "Aviso dea"),
          description_txt("6.", "Aviso apoyar en barra para abrir"),
          description_txt("7.", "Aviso punto de encuentro"),
          description_txt("8.", "Aviso de dirección de la salida"),
        ],
      );

      final row1_senales = Row(
        children: [
          image_riesgos("assets/salvamento/escalera_emergencia.png", "1"),
          const SizedBox(height: 5),
          image_riesgos("assets/salvamento/salida_emergencia.png","2"),
          const SizedBox(height: 5),
          image_riesgos("assets/salvamento/seguir.png","3"),
          const SizedBox(height: 5),
          image_riesgos("assets/salvamento/auxilios.png","4")
        ],
      );
      final row2_senales = Row(
        children: [
          image_riesgos("assets/salvamento/dea.png", "5"),
          const SizedBox(height: 5),
          image_riesgos("assets/salvamento/empujar.png", "6"),
          const SizedBox(height: 5),
          image_riesgos("assets/salvamento/punto_encuentro.png", "7"),
          const SizedBox(height: 5),
          image_riesgos("assets/salvamento/salida_exit.jpg", "8"),
        ],
      );

      final images = Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            row1_senales,
            row2_senales
          ],
        ),
      );

      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Señales de salvamento"),
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
  
