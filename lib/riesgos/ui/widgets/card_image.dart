import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/screens/senales.dart';

class card_image extends StatelessWidget{
  @override
  String pathImage = "";

  card_image(this.pathImage);

  Widget build(BuildContext context) {
    // TODO: implement build
    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        //ahora para las sombras
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0,0.7)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        boton_ver_mas()
      ],
    );
  }
}
class boton_ver_mas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _boton_ver_mas();
  }
}

class _boton_ver_mas extends State<boton_ver_mas>{
  void onPressedVisibility(){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Ver más información",
      onPressed: onPressedVisibility ,
      child: Icon(
          Icons.visibility
      ),
    );
  }
}