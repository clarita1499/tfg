import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/star.dart';

class review extends StatelessWidget {
  @override
  String pathImage = "assets/estudiante.jpg";
  String name = "Clara Molinos";
  String details = "1 review";
  String comment = "Este consejo me ha servido mucho!";
  double point;

  review(this.pathImage, this.name,this.details,this.comment, this.point);

  Widget build(BuildContext context) {
    // TODO: implement build
    final userComment = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            fontWeight: FontWeight.w900
        ),
      ),
    );
    final userInfo = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            color: Color(0xFFa3a5a7)
        ),
      ),
    );
    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0
        ),
      ),
    );
    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment
      ],
    );
    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),
      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover, //encuadre centro
          image: AssetImage(pathImage)
        ),
      ),

    );

    return Row(
      children: <Widget>[
        photo,
        userDetails,
        star(point)
        //faltan las estrellas
      ],
    );
  }
}