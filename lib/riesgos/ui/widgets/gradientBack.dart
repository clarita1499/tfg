import 'package:flutter/material.dart';

class gradientBack extends StatelessWidget{
  String titulo = "";

  gradientBack(this.titulo);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      decoration: BoxDecoration (
        gradient: LinearGradient(
            colors:[
              Color(0xFF4268D3),
              Color(0xFF584CD1)
            ],
          begin: FractionalOffset(0.2, 0.0), //como quieres q se unan los colores
          end: FractionalOffset (1.0,0.6),
          stops: [0.0,0.6],
          tileMode: TileMode.clamp
        )
      ),

      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
            fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}