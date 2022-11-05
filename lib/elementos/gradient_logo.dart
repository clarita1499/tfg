import 'package:flutter/material.dart';
import 'package:untitled/elementos/gradientBack.dart';

class gradient_logo extends StatelessWidget{
  @override
  String titulo = "";

  gradient_logo(this.titulo);

  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        gradientBack(titulo),
        Container(
          height: 170.0,
          width: 300.0,
          margin: EdgeInsets.only(
            top: 60.0,
            left: 60.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/logo.png")
            ),
          ),
        ),
      ],
    );
  }
}