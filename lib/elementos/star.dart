import 'package:flutter/material.dart';

class star extends StatelessWidget{
  @override
  double point = 5;

  star(this.point);

  Widget build(BuildContext context) {
    // TODO: implement build
    final start_mitad = Container(
      margin: EdgeInsets.only(
          right: 3.0
      ),
      child: Icon(
        Icons.star_half,
        size: 15.0,
        color: Color(0xFFf2C611),
      ),
    );

    final start_vacia = Container(
      margin: EdgeInsets.only(
          right: 3.0
      ),
      child: Icon(
        Icons.star_border,
        size: 15.0,
        color: Color(0xFFf2C611),
      ),
    );

    final star= Container(
      margin: EdgeInsets.only(
          right: 3.0
      ),
      child: Icon(
        Icons.star,
        size: 15.0,
        color: Color(0xFFf2C611),
      ),
    );

    /*
     getValoracion(double point) {
      var notas = point;
      switch(notas){
        case 0:
            Row(
              children: <Widget>[
                start_vacia,
                start_vacia,
                start_vacia,
                start_vacia,
                start_vacia
              ],
            );
            break;
        case 0.5 :
          Row(
            children: <Widget>[
              start_mitad,
              start_vacia,
              start_vacia,
              start_vacia,
              start_vacia
            ],
          );
          break;
        case 1:
          Row(
            children: <Widget>[
              star,
              start_vacia,
              start_vacia,
              start_vacia,
              start_vacia
            ],
          );
          break;
        case 1.5:
          Row(
            children: <Widget>[
              star,
              start_mitad,
              start_vacia,
              start_vacia,
              start_vacia
            ],
          );
          break;
        case 2:
          Row(
            children: <Widget>[
              star,
              star,
              start_vacia,
              start_vacia,
              start_vacia
            ],
          );
          break;
        case 2.5:
          Row(
            children: <Widget>[
              star,
              star,
              start_mitad,
              start_vacia,
              start_vacia
            ],
          );
          break;
        case 3:
          Row(
            children: <Widget>[
              star,
              star,
              star,
              start_vacia,
              start_vacia
            ],
          );
          break;
        case 3.5:
          Row(
            children: <Widget>[
              star,
              star,
              star,
              start_mitad,
              start_vacia
            ],
          );
          break;
        case 4:
          Row(
            children: <Widget>[
              star,
              star,
              star,
              star,
              start_vacia
            ],
          );
          break;
        case 4.5:
          Row(
            children: <Widget>[
              star,
              star,
              star,
              star,
              start_mitad
            ],
          );
          break;
        case 5 :
          Row(
            children: <Widget>[
              star,
              star,
              star,
              star,
              star
            ],
          );
          break;
      }
    }

     */
    return  Row(
      children: <Widget>[
        star,
        star,
        star,
        star,
        star
      ],
    );
  }
}