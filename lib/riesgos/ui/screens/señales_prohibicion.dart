
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class senales_prohibicion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final description = Column(
      children: [
        description_txt("1.", "Prohibido animales"),
        description_txt("2.", "Prohibido apagar con agua"),
        description_txt("3.", "Prohibido encender fuego"),
        description_txt("4.", "Prohibido la entrada a personal no autorizado"),
        description_txt("5.", "Prohibido tocar"),
        description_txt("6.", "Agua no potable"),
        description_txt("7.", "Prohibido fumar"),
        description_txt("8.", "Prohibido hacer fotos")
      ],
    );

    final row1_senales = Row(
      children: [
        image_riesgos("assets/prohibicion/prohibido_animales.png","1"),
        const SizedBox(height: 5),
        image_riesgos("assets/prohibicion/prohibido.png","2"),
        const SizedBox(height: 5),
        image_riesgos("assets/prohibicion/prohibido_encender_fuego.jpg","3"),
        const SizedBox(height: 5),
        image_riesgos("assets/prohibicion/no_peatones.png","4")
      ],
    );
    final row2_senales = Row(
      children: [
       image_riesgos("assets/prohibicion/no_tocar.png", "5"),
        const SizedBox(height: 5),
        image_riesgos("assets/prohibicion/agua_potable.png", "6"),
        const SizedBox(height: 5),
        image_riesgos("assets/prohibicion/prohibido_fumar.png", "7"),
        const SizedBox(height: 5),
        image_riesgos("assets/prohibicion/prohibido_no_fotos.jpg", "8"),
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
        title: Text("Señales de prohibición"),
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
  @override
  String imagePath = "";
  String txt_bottom = "";

  image_riesgos(this.imagePath,this.txt_bottom);

  Widget build(BuildContext context) {
    // TODO: implement build
    final image = SizedBox.fromSize(
      size: Size(70,70),
      child:  ClipOval(
        child: Image.asset(imagePath),
      ),
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