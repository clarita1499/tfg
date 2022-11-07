import 'package:flutter/material.dart';

class consejo extends StatelessWidget{
  int stars;
  String id_consejo;
  String txt_consejo;


  consejo(this.id_consejo, this.txt_consejo, this.stars);

  @override
  Widget build(BuildContext context) {

    final titulo_consejo = Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 500.0,
                left: 20.0,
                right: 20.0
            ),
            child: Text(
              "Consejo diario:",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900, //negrita
              ),
              textAlign: TextAlign.left,
            ),
          ),

        ]
    );
    final description = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0
      ),
      child: new Text(
        txt_consejo,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a),
        ),
      ),
    );
    return Column(
      children: <Widget>[
        titulo_consejo,
        description
      ],
    );
  }
}
