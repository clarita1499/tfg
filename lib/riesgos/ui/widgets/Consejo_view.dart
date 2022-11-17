import 'package:flutter/material.dart';

import '../../model/Consejo.dart';

class Consejo_view extends StatelessWidget{

  final myConsejo consejo;
  Consejo_view(this.consejo);

  @override
  Widget build(BuildContext context) {

    final titulo =Container(
        margin: new EdgeInsets.only(
            top: 8.0,
            left: 20.0,
            right: 20.0
        ),
      child: new Text(
              this.consejo.titulo,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
                color: Colors.indigo//negrita
              ),
      ),
      alignment: Alignment.bottomLeft,
    );
    final description = Container(
      margin: new EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0
      ),
      child: new Text(
        this.consejo.description,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a),
        ),
      ),
    );
    final likes = Container(
      margin: new EdgeInsets.only(
          top: 10.0,
        right: 10.0
      ),
      child: Text(
      'Likes ${this.consejo.likes}',
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.amber,
      ),
      textAlign: TextAlign.right,
      ),
      alignment: Alignment.bottomRight,
    );
    final user = Container(
      margin: new EdgeInsets.only(
          top: 2.0,
          right: 10.0
      ),
        child : Text(
      'Creador ${this.consejo.userOwner?.name} '
          ' ${this.consejo.userOwner?.lastname}',
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: Colors.indigo,
      ),
        ),
      alignment: Alignment.bottomRight,
    );

    return Column(
      children: <Widget>[
        //titulo_consejo,
        titulo,
        description,
        likes,
        user
      ],
    );
  }
}
